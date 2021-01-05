#!/bin/bash

output=$HOME/Sec/research/sys_info.txt

if [ -d $HOME/Sec/research/ ]
then
   echo "Directory $HOME/Sec/research/ already exists."
else
   echo "Directory $HOME/Sec/research/ not found. Creating..."
   mkdir $HOME/Sec/research
   echo "$HOME/Sec/research/ created!"
fi

if [ -f $output ]
then
   echo "File $output already exists."
   append_data=$(read -p "Would you like to append new information (Y/N):")
   echo "$append_data"
   if [ $append_data == Y ]
   then
      echo -e "**********" >> $output
   elsif [ $append_data == N ]
      mv $output $output_1
      touch $output
   else
      echo "Unexpected response. Exiting script."
      exit
   fi
else
   echo "Creating new file: $output"
   touch $output
   echo "$output created!"
fi

sleep 1s

echo -e "System Information v0.01\n on $(date)\n\n" >> $output
echo -e "  SPECS: $(uname -a)\n" >> $output
echo -e "  MACHINE TYPE: $MACHTYPE\n\n" >> $output
echo -e "  HOSTNAME: $HOSTNAME\n" >> $output
echo -e "  IP: $(ifconfig | grep inet\ addr: | grep -v 127.0.0.1 | cut -d: -f2 | awk '{print $1}')" >> $output
echo -e "  DEFAULT DNS: $(nslookup server | grep 'Default server:' | awk '{print $3}')\n\n" >> $output

#echo -e "System Information v0.01\n on $(date)"
#echo -e "System Information v0.01\n on $(date)"

files=("/etc/passwd" "/etc/shadow" "/etc/groups" "/etc/gshadow")
echo "Copying ${files}..." >> $output
sleep 1s
echo "Tasks completed!"
