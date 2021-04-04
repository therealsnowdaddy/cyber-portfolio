#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


cp dlogs_0310_0312_0315_delim dealer_by_time_data

echo "Command structure: ./dealer_by_time.sh MMDD HH:MM:SS AM|PM"
echo "Example: ./dealer_by_time.sh 0310 02:00:00 A"

echo -n "Enter 1 for Blackjack, 2 sor Roulette, 3 for Hold'Em:"
read GAME

case $GAME in

  1)
   echo "Blackjack"
   cat dealer_by_time_data | grep -e "$1" | grep -e "$2" | grep -e "$3" | awk -F% '{print $1,$2,$3,$4,$5}'
    ;;

  2)
   echo "Blackjack"
    cat dealer_by_time_data | grep -e "$1" | grep -e "$2" | grep -e "$3" | awk -F% '{print $1,$2,$3,$6,$7}'
    ;;

  3)
    echo "Hold'Em"
    cat dealer_by_time_data | grep -e "$1" | grep -e "$2" | grep -e "$3" | awk -F% '{print $1,$2,$3,$8,$9}'
    ;;
esac 
# echo $the_time $the_date $the_tod
