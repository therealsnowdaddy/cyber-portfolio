#/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


out_file="dlogs"
sub_direct="dscripts"
dest_direct="../Player_Dealer_Correlation/"

mv ${out_file}* $dest_direct
cp Notes* $dest_direct
mkdir ${dest_direct}${sub_direct}
cp *.sh ${dest_direct}${sub_direct}/

