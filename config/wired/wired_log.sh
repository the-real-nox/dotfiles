#!/bin/bash
NOTIFICATION_LOG_FILE="$HOME/Notifications/wired.log"

jq -r '"\u001b[32m[\u001b[33m\(.time | strftime("%H:%M:%S"))\u001b[32m] \u001b[36m\(.summary): \u001b[0m\(.body)"' \
    "$NOTIFICATION_LOG_FILE" | less
