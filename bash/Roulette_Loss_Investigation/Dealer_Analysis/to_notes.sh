#!/bin/bash

cat $1 | grep -Ei "05:00:00%AM|08:00:00%AM|02:00:00%PM|08:00:00%PM|11:00:00%PM" | sed 's/%/      /g' > to_notes.tmp
# cat to_notes.tmp | sed 's/%/      /g' | >> to_notes2.tmp
cat to_notes.tmp > Notes_Dealer_Analysis
wc -l to_notes.tmp >> Notes_Dealer_Analysis

rm to_notes.tmp
rm to_notes2.tmp

