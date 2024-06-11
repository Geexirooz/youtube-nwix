#!/usr/bin/env bash

####Basics:

mygreeting=hello
mygreeting2="Good Morning"
number=6

echo "$mygreeting man!"



####Special Attributes:
#Read Only:
declare -r myname="Roozbeh"

#lower:
declare -l text="This is SOME TeXT!"

#upper:
declare -u text1="This is SOME TeXT!"

#list all variables defined in the current bash
declare -p

