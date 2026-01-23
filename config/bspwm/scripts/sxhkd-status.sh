#!/bin/sh

SXHKD_FIFO_DIR="$HOME/.cache/sxhkd"
SXHKD_FIFO="$SXHKD_FIFO_DIR/status.fifo"

while read -r line; do
  case "$line" in
    *"BBegin chain"*)
        polybar-msg action notify_resize hook 1
        ;;
    *"EEnd chain"*)
        polybar-msg action notify_resize hook 0
        ;;
  esac
done < "$SXHKD_FIFO"
