#! /bin/fish
set left (sensors -j nct6791-isa-0290 | jq '.["nct6791-isa-0290"]["fan2"]["fan2_input"]')
set speed $left
set icon "🎐"
if [ $speed -ge 1200 ]
    set icon "🌪"
else if [ $speed -ge 1100 ]
    set icon "🍃"
end

echo $left"RPM "$icon
# xrandr --output DP-1 --primary
