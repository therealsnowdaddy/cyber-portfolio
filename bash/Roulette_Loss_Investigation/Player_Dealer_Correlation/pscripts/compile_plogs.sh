#!/bin/bash
out_file="plogs"

./analyze_plogs.sh $1
./analyze_plogs.sh $2
./analyze_plogs.sh $3

#./analyze_plogs.sh $4
#./analyze_plogs.sh $5
#./analyze_plogs.sh $6
#./analyze_plogs.sh $7


cat ${out_file}_$1_delim > ${out_file}_$1_$2_$3_delim
rm ${out_file}_$1_delim
cat ${out_file}_$2_delim >> ${out_file}_$1_$2_$3_delim
rm ${out_file}_$2_delim
cat ${out_file}_$3_delim >> ${out_file}_$1_$2_$3_delim
rm ${out_file}_$3_delim

#cat ${out_file}_$4_delim >> ${out_file}_delim
#rm ${out_file}_$4_delim
#cat ${out_file}_$5_delim >> ${out_file}_delim
#rm ${out_file}_$5_delim
#cat ${out_file}_$6_delim >> ${out_file}_delim
#rm ${out_file}_$6_delim
#cat ${out_file}_$7_delim >> ${out_file}_delim
#rm ${out_file}_$7_delim

cat ${out_file}_$1 > ${out_file}_$1_$2_$3
rm ${out_file}_$1
cat ${out_file}_$2 >> ${out_file}_$1_$2_$3
rm ${out_file}_$2
cat ${out_file}_$3 >> ${out_file}_$1_$2_$3
rm ${out_file}_$3

#cat ${out_file}_$4 > ${out_file}
#rm ${out_file}_$4
#cat ${out_file}_$5 > ${out_file}
#rm ${out_file}_$5
#cat ${out_file}_$6 > ${out_file}
#rm ${out_file}_$6
#cat ${out_file}_$7 > ${out_file}
#rm ${out_file}_$7

#./cleanup.sh
