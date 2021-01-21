#!/bin/bash

killall -q polybar

while pgrep -x polybar > /dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d ":" -f1);do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
done

