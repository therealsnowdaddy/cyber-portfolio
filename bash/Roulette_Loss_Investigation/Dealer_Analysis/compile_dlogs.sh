#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 

out_file="dlogs"

./analyze_${out_file}.sh $1
./analyze_${out_file}.sh $2
./analyze_${out_file}.sh $3

cat ${out_file}_$1_delim > ${out_file}_$1_$2_$3_delim
rm ${out_file}_$1_delim
cat ${out_file}_$2_delim >> ${out_file}_$1_$2_$3_delim
rm ${out_file}_$2_delim
cat ${out_file}_$3_delim >> ${out_file}_$1_$2_$3_delim
rm ${out_file}_$3_delim

cat ${out_file}_$1 > ${out_file}_$1_$2_$3
rm ${out_file}_$1
cat ${out_file}_$2 >> ${out_file}_$1_$2_$3
rm ${out_file}_$2
cat ${out_file}_$3 >> ${out_file}_$1_$2_$3
rm ${out_file}_$3

#./cleanup.sh
