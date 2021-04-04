#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


cat $1 | sed 's/%/	/g' | grep - > to_notes.tmp

cat to_notes.tmp > Notes_Player_Analysis
wc -l to_notes.tmp >> Notes_Player_Analysis

rm to_notes.tmp

