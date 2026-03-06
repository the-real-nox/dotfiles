#!/bin/bash

HELP=$(printf "
%s [operation]

Send system-notifications

positional argument:
\t- 'adio_in'  : call on mic state change
\t- 'adio_out' : call on speaker state change
\t- 'backlight': call on backlight state change
" "$0")

OP=$1

fail () {
    echo "$HELP"
}

audio_out () {
    wpctl_output="$(wpctl get-volume @DEFAULT_SINK@)"

    # Get info wheter or not we're muted from wire-plumber
    if [ "$(echo "$wpctl_output" | grep -oF \[MUTED\])" = \[MUTED\] ]; then
        notify-send "" "" --hint="string:wired-tag:sys_notify" \
            -i icons/mute.png -t 900
        exit 0
    fi

    volume="$(bc -l <<< "$(echo "$wpctl_output" | grep -oE "[[:digit:]]{1,2}\.[[:digit:]]{2} | grep -oE [[:digit:]]{1,2}") * 10")"
    echo "$volume"

    if [ "$volume" = "0" ]; then
        notify-send "" "" --hint="string:wired-tag:sys_notify" \
            -i icons/unmute.png -t 900
        exit 0
    fi

    notify-send "" "$volume" --hint="string:wired-tag:sys_notify" \
            -i icons/volume_change.png -h int:value:"$volume" -t 1100
}

case "${OP}" in
    audio_out) audio_out;;
    audio_in) echo 'AUDIO_IN';;
    backlight) echo 'BACKLIGHT';;
    -h) fail;;
    *) fail; exit 1;;
esac
