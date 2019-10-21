#! /bin/sh
FAN2=$(sensors -j nct6791-isa-0290 | jq '.["nct6791-isa-0290"]["fan2"]["fan2_input"]')
echo "${FAN2}"
