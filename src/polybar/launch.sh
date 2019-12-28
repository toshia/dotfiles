#!/usr/bin/env sh

killall -q polybar
export PRIMARY_MONITOR=Shibafu

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

exec polybar -r $PRIMARY_MONITOR
