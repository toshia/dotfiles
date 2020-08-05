#!/usr/bin/env sh

killall -q polybar
export PRIMARY_MONITOR=$(polybar --list-monitors | head -n1 | cut -d":" -f1)

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

exec polybar -r $PRIMARY_MONITOR
