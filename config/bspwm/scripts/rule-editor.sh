#!/bin/sh

LOC="$(realpath "$(dirname "$0")")/rule-editor.sh"

if ! command -v bspwm-rule-editor >/dev/null 2>&1; then
    echo "Installing-script..."
    sudo ln -sf "$LOC" /usr/local/bin/bspwm-rule-editor
fi

HELP=\
"simple bspwm-rule-definer
by noxie64

-h Display this help-page
-f Set to always float
-b Disable focus border"

if [ "$1" = "-h" ]; then
    echo "$HELP"
    exit 0
fi

CONFIG_OPTIONS=""
if [ "$1" = "-b" ]; then
    CONFIG_OPTIONS="border=off"
elif [ "$1" = "-f" ]; then
    CONFIG_OPTIONS="state=floating"
elif [ "$1" = "-bf" ] || [ "$1" = "-fb" ]; then
    CONFIG_OPTIONS="state=floating border=off"
else
    echo "Invalid flags supplied"
    exit 1
fi


WIN_CLASS="$(xprop | sed -n 's/WM_CLASS\(.*\) = .*"\(.*\)"/\2/p')"
CONFIG="bspc rule -a $WIN_CLASS $CONFIG_OPTIONS"

echo "Creating rule for $WIN_CLASS..."
echo "Rule: $CONFIG"
echo "$CONFIG" >> ~/.config/bspwm/generated_rules

bspc wm -r
