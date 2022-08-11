#!/bin/bash
# https://github.com/kiddae/polybar-themes/blob/master/miniblocks/launch.sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --quiet -c ~/.config/polybar/config.homeOffice -rq ws &
polybar --quiet -c ~/.config/polybar/config.homeOffice -rq tray &

echo "Polybar launched..."
