#!/bin/bash

## Variables

file_date=$1
out_file="plogs_$1"
tmp_file="plogs_tmp"
tmp_file2="plogs_tmp2"

## Section Headers

#   echo $file_date > $tmp_file						#prints file_date to $tmp_file
#   echo "TIME%AMOUNT%PLAYERS" >> $tmp_file				#prints column headers

## Import

   cat ${file_date}_win_loss_player_data > $tmp_file			#import all data for file_date
#   cat ${file_date}_win_loss_player_data | grep - >> $tmp_file		#import all data, with no headers, for file_date

## Massage

   sed 's/     */%/g' $tmp_file > $tmp_file2				#replaces artificial <TAB>s with delimiter (%)
   sed 's/	/%/g' $tmp_file2 > $tmp_file				#replaces <TAB>s with delimiter
   sed 's/%$//g' $tmp_file > $tmp_file2					#removes trailing delimiter
   sed 's/  */ /g' $tmp_file2 > $tmp_file				#removes extra spaces
   sed 's/ ,/,/g' $tmp_file > $tmp_file2				#removes spaces before commas
   sed 's/, /,/g' $tmp_file2 > $tmp_file				#removes spaces after commas
   sed 's/ /%/' $tmp_file > $tmp_file2					#replaces <SPACE> between time and AM/PM with delimiter
   sed 's/%%/%/g' $tmp_file2 > $tmp_file                                #removes double delimiters
   sed 's/ %/%/' $tmp_file > $tmp_file2                                 #removes <SPACE> before delimiter
   sed "s/^/${file_date}%/" $tmp_file2 > $tmp_file			#adds date to record

   tail -n +2 $tmp_file > $tmp_file2

## Export Results

   cat $tmp_file2 > ${out_file}_delim					#output delimited text to file

   cat $tmp_file2 | awk -F% '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15}' > $out_file		#output human-readable version to file

## Debugging

#   clear
#   echo "Standard output: ${out_file}"					#shows name of main file
#   cat $out_file							#displays main formatted output file
#   echo "Delimited output: ${out_file}_delim"				#shows name of delimited file
#   cat ${out_file}_delim						#displays delimited output file

## Cleanup

   rm $tmp_file								#removes temp files
   rm $tmp_file2

#done

