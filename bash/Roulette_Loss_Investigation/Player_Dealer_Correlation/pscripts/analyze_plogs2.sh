#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


file_date=$1
out_file="text_plogs_$1"
tmp_file="text_plogs_tmp"
tmp_file2="text_plogs_tmp2"

## Section Headers

   echo $file_date > $tmp_file							#prints date
   echo "TIME%AMOUNT%PLAYERS" >> $tmp_file				#prints column headers

## Import

   cat ${file_date}_win_loss_player_data | grep - >> $tmp_file

   sed 's/        /%/g' $tmp_file > $tmp_file2
   sed 's/	/%/g' $tmp_file2 > $tmp_file
   sed 's/%$//g' $tmp_file > $tmp_file2				#removes trailing `%` delimiter
   sed 's/ ,/,/g' $tmp_file2 > $tmp_file
   sed 's/, /,/g' $tmp_file > $tmp_file2


   cat $tmp_file2 > ${out_file}_delim

   cat $tmp_file2 | awk -F"%" '{print $1,$2,$3}' > $out_file

   clear
   echo "Standard output: ${out_file}"					#shows name of main file
   cat $out_file							#displays main formatted output file
   echo "Delimited output: ${out_file}_delim"				#shows name of delimited file
   cat ${out_file}_delim						#displays delimited output file

   rm $tmp_file
   rm $tmp_file2

#done

