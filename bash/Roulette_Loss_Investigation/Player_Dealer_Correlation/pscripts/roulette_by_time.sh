#!/bin/bash

cp dlogs_0310_0312_0315_delim roulette_by_time_data

echo "Command structure: ./roulette_by_time.sh MMDD HH:MM:SS AM|PM"
echo "Example: ./roulette_by_time.sh 0310 02:00:00 A"

cat roulette_by_time_data | grep -e "$1" | grep -e "$2" | grep -e "$3" | awk -F% '{print $1,$2,$3,$6,$7}'

# echo $the_time $the_date $the_tod
