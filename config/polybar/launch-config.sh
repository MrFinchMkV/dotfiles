#!/bin/bash
# Inspired by: https://github.com/kiddae/polybar-themes/blob/master/miniblocks/launch.sh
# But heavily tuned ;P
# Or let's say optimized

env=$1

if [ -z "$env" ]; then
  echo "Add environment name!"
  exit 1
fi

# Terminate already running bar instances
if [ "$(pgrep polybar | wc -l)" -gt 0 ]; then
  killall -q polybar
  echo "Killed old polybar instances."
fi

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --quiet -c "$HOME/.config/polybar/$env.cfg" -rq ws &
polybar --quiet -c "$HOME/.config/polybar/$env.cfg" -rq tray &

echo "Polybar launched..."
