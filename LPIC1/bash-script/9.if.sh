#!/usr/bin/env bash

declare -i a=3

if [[ $a -gt 4 ]]; then #OR: if (( $a > 4 )); then
	echo "$a is greater than 4"
elif [[ $a -gt 2 ]]; then
	echo "$a is greater than 2"
else
	echo "$a is not greater than 4 nor 2"
fi
