#! /bin/fish
set left (sensors -j applesmc-isa-0300 | jq '.["applesmc-isa-0300"]["Left side  "]["fan1_input"]')
set right (sensors -j applesmc-isa-0300 | jq '.["applesmc-isa-0300"]["Right side "]["fan2_input"]')
set speed (math "($left + $right)/2")
set icon "🎐"
if [ $speed -ge 2800 ]
    set icon "🌪"
else if [ $speed -ge 2400 ]
    set icon "🍃"
end

echo $left"RPM "$icon" "$right"RPM"
