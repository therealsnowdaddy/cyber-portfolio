#/bin/bash
out_file="plogs"
sub_direct="pscripts"
dest_direct="../Player_Dealer_Correlation/"

mv ${out_file}* $dest_direct
cp Notes* $dest_direct
mkdir ${dest_direct}${sub_direct}
cp *.sh ${dest_direct}${sub_direct}/

