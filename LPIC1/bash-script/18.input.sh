#!/usr/bin/env bash

echo "what is your name?"
read name
echo "your name's $name"

############################################

echo "what is your password?"
read -s pass                     #SILENT
echo "your pass is $pass"

###########################################

read -p "what is your password? " password
echo "your pass is $password"

###########################################

#To see more options:
#help read

##########################################

echo "which animal?"
select animal in "cat" "dog" "bird" "fish"
do
	echo "You selected $animal Let's move on"
	break
done

#########################################

echo "which animal?"
select animal in "cat" "dog" "quit"
do
	case $animal in
		cat) echo "you selected cat";;
		dog) echo "you selected dog";;
		quit) break;;
		*) echo "what's that? :D";;
	esac
done

#########################################

# Reading multiple inputs using an array

echo "Enter names : "
read -a names
echo "The entered names are : ${names[0]}, ${names[1]}."
