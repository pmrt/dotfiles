#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bars
# echo "---" | tee -a /tmp/polybar1.log
# polybar top 2>&1 | tee -a /tmp/polybar1.log & disown

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#	MONITOR=$m polybar --reload top &
#done

echo "---" | tee -a /tmp/polybar-mon1.log
MONITOR=HDMI-0 polybar monitor1 2>&1 | tee -a /tmp/polybar-mon1.log &
disown
echo "---" | tee -a /tmp/polybar-mon2.log
MONITOR=DP-0 polybar monitor2 2>&1 | tee -a /tmp/polybar-mon2.log &
disown

echo "Bars launched..."
