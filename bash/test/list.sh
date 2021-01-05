#!/bin/bash

# list.sh

file=list.txt

while read -r line; do
  [[ $line = \#* ]] && continue
  printf '%s\n' "$line"
done < "$file"
