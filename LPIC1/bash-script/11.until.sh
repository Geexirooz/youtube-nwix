#!/usr/bin/env bash

declare -i a=0

until (( a == 10 ))
do
	echo "$a"
	(( a++ ))
done


