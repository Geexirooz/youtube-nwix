#!/bin/bash


#terminology:
#1> ~ 		:	Tilde Expansion
#2> {...}	:	Brace Expansion
#3> ${...}	:	Parameter Expansion
#4> $(...)	:	Command Substitution     #SOMETIMES two backticks '`'
#5> $((...))	:	Arithmetic Expansion     $(expr $var1 + $var2)   OR   $[$var1 \* $var2]

##########2:
echo {1..10..2} #> 1 3 5 7 9
echo {01..100}	#> 001 002 003 004 ... 098 099 100


##########3:
a="Hello there!"
echo $a
echo ${a} #more standard and it is more clear for bash

echo ${a:6}	#> prints out from the 6th character:"there!"
echo ${a:6:3}	#> prints out 3 chars from the 6th char:"the"

#To replace ONLY the first instance:
echo ${a/e/_}   #> "H_llo there!"

#To replace ALL instances:
echo ${a//e/_}  #> "H_llo th_r_!""

###IMPORTANT###
#########Extra:
#WHAT is the difference between " and '?
#Double quotes let the command interpret the content in it
#BUT
#This is not true in Single quotes
