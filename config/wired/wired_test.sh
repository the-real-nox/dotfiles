#!/bin/bash

echo "Testing basic notification..."
notify-send "Arch Notification Test" "This is a normal notification."

sleep 2

echo "Testing urgent notification..."
notify-send -u critical "Urgent Notification" "This is a critical alert!"

sleep 2

echo "Testing timed notification (5 seconds)..."
notify-send -t 5000 "Timed Notification" "This notification will disappear after 5 seconds."

sleep 2

echo "Testing repeated notifications..."
for i in {1..3}; do
  notify-send "Repeated Notification" "Notification number $i"
  sleep 1
done

echo "All notification tests sent."
