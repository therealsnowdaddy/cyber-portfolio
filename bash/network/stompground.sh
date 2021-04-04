#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021
# stompground - A script to automate footprinting of target sites & systems

#  RUN   AS   ROOT   !

### VARIABLES

ipinput="GO"
iplist=""
ipstocheck=0
dnstoquery="127.0.0.1"
outfile="stompground.out"

processingoff=0

# echo "DEBUG0|Vars -- ipinput: $ipinput iplist: $iplist ipstocheck: $ipstocheck" 

### INITIALIZATION

if [ $EUID -ne 0 ]
then
	echo "MUST Run As Root!"
	exit
fi

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

read -a iparray <<< $iplist

### PROCESSING


while [ $processingoff -eq 0 ]	# [LOOP2]
do

	echo $dnstoquery
	for address in ${iparray[@]}
	do

		tmpfile="stompground_$address.tmp"
		echo
		# echo -e "\n++++++++++++++++++++" > $tmpfile
		echo -e "REPORT FOR ADDRESS: ${address} \n" >> $tmpfile

		echo -e "----------" >> $tmpfile
		echo -e "WHOIS results\n----------\n" >> $tmpfile
		whois $address >> $tmpfile
		echo -e "\n----------" >> $tmpfile

		echo -e "DIG results\n----------" >> $tmpfile
		dig @$dnstoquery $address >> $tmpfile # dig registry info
		echo -e "\n----------" >> $tmpfile

		echo -e "NSLOOKUP results\n----------" >> $tmpfile
		nslookup -type=A $address $dnstoquery >> $tmpfile # dig registry info
		echo -e "\n----------" >> $tmpfile
                nslookup -type=CNAME $address $dnstoquery >> $tmpfile # dig registry info
                echo -e "\n----------" >> $tmpfile
                nslookup -type=NS $address $dnstoquery >> $tmpfile # dig registry info
                echo -e "\n----------" >> $tmpfile
                nslookup -type=MX $address $dnstoquery >> $tmpfile # dig registry info
                echo -e "\n----------" >> $tmpfile
                nslookup -type=SOA $address $dnstoquery >> $tmpfile # dig registry info
                echo -e "\n----------" >> $tmpfile
                nslookup -type=TXT $address $dnstoquery >> $tmpfile # dig registry info
                echo -e "\n----------" >> $tmpfile
                nslookup -type=PTR $address $dnstoquery >> $tmpfile # dig registry info
                echo -e "\n----------" >> $tmpfile

		echo -e "PING results\n----------\n" >> $tmpfile
		ping -c 10 $address >> $tmpfile #ping target address
		echo -e "\n----------" >> $tmpfile

		echo -e "TRACEROUTE results\n----------\n" >> $tmpfile
		traceroute $address >> $tmpfile # traceroute
		echo -e "\n----------" >> $tmpfile

		echo -e "NMAP results\n----------" >> $tmpfile
		nmap -Pn -sS $address >> $tmpfile # nmap target address
		nmap -Pn -sV $address >> $tmpfile
		echo -e "\n----------" >> $tmpfile

		echo -e "\n++++++++++++++++++++\n\n" >> $tmpfile
		cat $tmpfile >> $outfile
		echo "Did ${address}!"
	done
	processingoff=1
done				# [ENDLOOP2]

### OUTPUT
