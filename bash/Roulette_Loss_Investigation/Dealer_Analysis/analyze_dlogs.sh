#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


## Variables

file_date=$1
file_time1=$2
file_time2=$3
file_time3=$4
file_time4=$5
file_time5=$6
out_file="dlogs_$1"
tmp_file="dlogs_tmp"
tmp_file2="dlogs_tmp2"

## Section Headers

#   echo $file_date > $tmp_file						#prints file_date to $tmp_file
#   echo "TIME%BLACK JACK%ROULETTE%HOLD'EM" >> $tmp_file				#prints column headers

## Import

   cat ${file_date}_Dealer_schedule > $tmp_file				#import all loss data for file_date
#   cat ${file_date}_Dealer_schedule | grep -Ei "05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM"  >> $tmp_file		#import all loss data for file_date

## Massage

   sed 's/     */%/g' $tmp_file > $tmp_file2				#replaces artificial <TAB>s with delimiter (%)
   sed 's/	/%/g' $tmp_file2 > $tmp_file				#replaces <TAB>s with delimiter
   sed 's/%$//g' $tmp_file > $tmp_file2					#removes trailing `%` delimiter
   sed 's/  */ /g' $tmp_file2 > $tmp_file				#removes extra spaces
   sed 's/ ,/,/g' $tmp_file > $tmp_file2				#removes spaces before commas
   sed 's/, /,/g' $tmp_file2 > $tmp_file				#removes spaces after commas
   sed 's/%%/%/g' $tmp_file2 > $tmp_file                                #removes double delimiters
   sed 's/ %/%/' $tmp_file > $tmp_file2                                 #removes <SPACE> before delimiter
   sed 's/ /%/g' $tmp_file > $tmp_file2					#converts remaining spaces to delimiter
   sed "s/^/${file_date}%/" $tmp_file2 > $tmp_file                      #adds date to record

   tail -n +3 $tmp_file > $tmp_file2


## Export Results

   cat $tmp_file2 > ${out_file}_delim					#output delimited text to file

   cat $tmp_file2 | awk -F% '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}' > $out_file		#output human-readable version to file

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

#echo "March 10" > Dealer_Analysis_Outcome
#echo "TIME	BJ Dealer	Roulette Croupier	Hold'em Dealer" >> Dealer_Analysis_Outcome
#grep -Ei "05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM" 0310_Dealer_schedule >> Dealer_Analysis_Outcome
#echo "March 12" >> Dealer_Analysis_Outcome
#echo "TIME	BJ Dealer	Roulette Croupier	Hold'em Dealer" >> Dealer_Analysis_Outcome
#grep -Ei "05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM" 0312_Dealer_schedule >> Dealer_Analysis_Outcome 

#echo "March 15" >> Dealer_Analysis_Outcome 
#echo "TIME	BJ Dealer	Roulette Croupier	Hold'em Dealer" >> Dealer_Analysis_Outcome
#grep -Ei "05:00:00 AM|08:00:00 AM|02:00:00 PM" 0315_Dealer_schedule >> Dealer_Analysis_Outcome
   echo "Analysis Complete:"
   cat ${out_file}

