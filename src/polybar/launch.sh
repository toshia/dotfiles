#!/usr/bin/env sh

killall -q polybar

if [[ -z "$1" ]]; then
    export PRIMARY_MONITOR=$(polybar --list-monitors | head -n1 | cut -d":" -f1)
else
    export PRIMARY_MONITOR=$1
fi

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

exec polybar -r $PRIMARY_MONITOR
