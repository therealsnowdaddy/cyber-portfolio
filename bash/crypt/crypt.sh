#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


read -p "Path to input file:" in_file
read -p "Encryption key:" enc_key
read -p "Initialization Vector (IV):" init_vec
read -p "[E]ncode or [D]ecode, any other to exit?" action

echo "[ DEBUG Input: $in_file  Key: $enc_key  IV: $init_vec  Action: $action ]"

if [[ "${action,,}" == "e" ]]
then
	echo "Encoding file..."
	openssl enc -pbkdf2 -nosalt -aes-256-cbc -in ${in_file} -base64 -e -out ${in_file}.enc -K ${enc_key} -iv ${init_vec}
elif [[ "${action,,}" == "d" ]]
then
	echo "Decoding file..."
	openssl enc -pbkdf2 -nosalt -aes-256-cbc -in ${in_file} -base64 -d -out ${in_file}.txt -K ${enc_key} -iv ${init_vec}
else
	echo "Program halted."
	exit
fi
