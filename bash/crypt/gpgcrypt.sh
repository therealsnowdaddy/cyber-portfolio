#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


#  gpgcrypt () {
 #       if [  ] ; then
	case $1 in
	1)	gpg --generate-key	;;
        2)	gpg -e			;;
        3)	gpg -d			;;
        *)	exit			;;
	esac
 #        else
 #            echo "'$1' is not a valid file"
 #        fi
 #   }


