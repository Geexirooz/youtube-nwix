#!/usr/bin/env bash

###Indexed Arrays:

snacks=("apple" "banana" "orange")
#OR:
declare -a snacks=("apple" "banana" "orange")


echo ${snacks[2]}

#To write in a specific index
snacks[5]="grapes"


#To append:
####IF you do not put it into parenthesis, it will overrides the first value
snacks+=("mango")


#To see all values:
echo ${snacks[@]}

####Bash version 4 and above:
###Associative array:

declare -A assArray2=( [HDD]=Samsung [Monitor]=Dell [Keyboard]=A4Tech )
declare -A office
office[city]="San Francisco"
office["building name"]="HQ West"

echo ${office["building name"]} is in ${office[city]}

#########let's learn FOR before continuing any further


#####iterate over keys and values

declare -a drops=( [3]="Pling" [5]="Plang" [7]="Plong")

for i in ${!drops[@]}
do
        echo $i is ${drops[$i]}
done
echo "The array contains ${#drops[@]} elements"


