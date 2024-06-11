#!/bin/bash
while getopts 'A:B:C:D:' details; do
	case "$details" in
		A)
			echo "Citizen Name is $OPTARG" ;;
		B)
			echo "Citizen ID is $OPTARG";;
		C)
			echo "Birth Place is $OPTARG";;
		D)
			echo "Occupation is $OPTARG";;
		*)
			exit 1;;
		esac
	done
	shift "$(($OPTIND -1))"



#OUTPUT:
./script -A Danny -B 456 -C Toronto -D Author #This will print:

Citizen Name is Danny
Citizen ID is 456
Birth Place is Toronto
Occupation is Author



#Useful links:
https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
