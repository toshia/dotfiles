#!/bin/sh

curl --silent "https://tepco-usage-api.appspot.com/quick.txt" | awk -F',' '{ printf "%02.1f%%", $2 / $3 * 100 }'
