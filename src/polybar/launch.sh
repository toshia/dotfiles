#!/usr/bin/env sh

killall -q polybar
export PRIMARY_MONITOR=$(polybar --list-monitors | awk -F':' '{ print $1 }')

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

exec polybar -r $PRIMARY_MONITOR
