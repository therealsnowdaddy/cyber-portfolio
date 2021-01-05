#!/bin/bash

# Extract the username and its shell from /etc/passwd:
#while IFS=: read -r user pass uid gid gecos home shell; do
#  printf '%s: %s\n' "$user" "$shell"
#done < /etc/passwd

#!/bin/bash
filename='plogs_0310_0312_0315_delim'
n=1
while IFS=% read -r line;
do
# for read each line
echo -e "$line"
n=$((n+1))
done < $filename
