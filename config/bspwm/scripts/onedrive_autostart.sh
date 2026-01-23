#!/bin/sh

pgrep -x onedrive > /dev/null && exit 0
screen -L -Logfile onedrive.log -dmS onedrive onedrive --monitor ~/OneDrive
