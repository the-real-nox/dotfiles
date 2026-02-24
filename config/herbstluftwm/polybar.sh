#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch Polybar on every monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload &
  done
else
  polybar --reload &
fi
