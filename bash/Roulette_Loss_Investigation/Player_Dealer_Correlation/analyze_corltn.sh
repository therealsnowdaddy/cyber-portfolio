#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


file_date="$1_$2_$3"
out_file="clogs"
in_fileA="dlogs_0310_0312_0315_delim"
in_fileB="plogs_0310_0312_0315_delim"
tmp_file="clogs_tmp"
tmp_file2="clogs_tmp2"

## Section Headers

#   echo $file_date > $tmp_file							#prints date
#   echo "TIME%ROULETTE%PLAYERS" >> $tmp_file				#prints column headers

## Import

paste -d"%" dlogs_0310_0312_0315_delim plogs_0310_0312_0315_delim > $tmp_file
 sed 's/%/	/g' $tmp_file > $tmp_file2

cat $tmp_file2 | awk -F"	" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$13,$14}' > $out_file
echo -e "\n\n"
cat $tmp_file2 > ${out_file}_delim

#   clear
#   echo "Standard output: ${out_file}"					#shows name of main file
#   cat $out_file							#displays main formatted output file
#   echo "Delimited output: ${out_file}_delim"				#shows name of delimited file
#   cat ${out_file}_delim						#displays delimited output file

#   rm $tmp_file
#   rm $tmp_file2

#done

