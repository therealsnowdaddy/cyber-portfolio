#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 
# A script to automate footprinting of target sites & systems


### VARIABLES

ipinput="GO"
iplist=""
ipstocheck=0
outfile="footping.out"


processingoff=0

# echo "DEBUG0|Vars -- ipinput: $ipinput iplist: $iplist ipstocheck: $ipstocheck" 
rm $outfile
ipinput=""

### INITIALIZATION

# get address(es)

while [ "$ipinput" != "" ]	# [LOOP1]
do

	echo "When IP Adress entries are complete, press [RETURN] at the prompt."
	read -r -p "Please enter an IP address and press [RETURN]: " ipinput
	echo $ipinput

#	echo "DEBUG1|Vars -- ipinput: $ipinput iplist: $iplist ipstocheck: $ipstocheck"

	if [ "$ipinput" != "" ]
	then
		ipstocheck=$(( $ipstocheck + 1 ))
		if [ $ipstocheck -eq 1 ]
		then
			iplist="${ipinput}"
		else
			iplist="${iplist} ${ipinput}"
		fi
		# continue
	fi
#	echo "DEBUG2|Vars -- ipinput:" $ipinput "iplist: $iplist ipstocheck: $ipstocheck" 

done			# [ENDLOOP1]

# read -a iparray <<< $iplist

readarray -t iparray < ranges.in

### PROCESSING

echo "Processing..."

while [ $processingoff -eq 0 ]	# [LOOP2]
do

#	dnstoquery="8.8.8.8"
#	echo $dnstoquery
	for address in ${iparray[@]}
	do
		count=1
		tmpfile="footping_item${count}.tmp"
		# echo -e "\n++++++++++++++++++++" > $tmpfile
		echo -e "REPORT FOR ADDRESS: ${address} \n" >> $tmpfile

		echo -e "----------" >> $tmpfile
		echo -e "FPING results\n----------\n" >> $tmpfile
		fping -d -A -D -g "$address"  >> $tmpfile 
		fping -C 5 -d -D -A -g "$address"  >> $tmpfile 
#		fping -C 5 -d -D -A < ranges.in  >> $tmpfile 
		echo -e "\n----------" >> $tmpfile

		#echo -e "DIG results\n----------" >> $tmpfile
		#dig @$dnstoquery $address >> $tmpfile # dig registry info
		#echo -e "\n----------" >> $tmpfile

		#echo -e "NSLOOKUP results\n----------" >> $tmpfile
		#nslookup -type=A $address $dnstoquery >> $tmpfile # dig registry info
		#echo -e "\n----------" >> $tmpfile
                #nslookup -type=CNAME $address $dnstoquery >> $tmpfile # dig registry info
                #echo -e "\n----------" >> $tmpfile
                #nslookup -type=NS $address $dnstoquery >> $tmpfile # dig registry info
                #echo -e "\n----------" >> $tmpfile
                #nslookup -type=MX $address $dnstoquery >> $tmpfile # dig registry info
                #echo -e "\n----------" >> $tmpfile
                #nslookup -type=SOA $address $dnstoquery >> $tmpfile # dig registry info
                #echo -e "\n----------" >> $tmpfile
                #nslookup -type=TXT $address $dnstoquery >> $tmpfile # dig registry info
                #echo -e "\n----------" >> $tmpfile
                #nslookup -type=PTR $address $dnstoquery >> $tmpfile # dig registry info
                #echo -e "\n----------" >> $tmpfile

		#echo -e "PING results\n----------\n" >> $tmpfile
		#ping -c 10 $address >> $tmpfile #ping target address
		#echo -e "\n----------" >> $tmpfile

		#echo -e "TRACEROUTE results\n----------\n" >> $tmpfile
		#traceroute $address >> $tmpfile # traceroute
		#echo -e "\n----------" >> $tmpfile

		#echo -e "NMAP results\n----------" >> $tmpfile
		#nmap -sS $address >> $tmpfile # nmap target address
		#nmap -sV $address >> $tmpfile
		#echo -e "\n----------" >> $tmpfile

		echo -e "\n++++++++++++++++++++\n\n" >> $tmpfile
		cat $tmpfile >> $outfile
		echo "Did ${address}!"

		rm $tmpfile
		count=$(( $count + 1 ))
	done
	processingoff=1
done				# [ENDLOOP2]

### OUTPUT
