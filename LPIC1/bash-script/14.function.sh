#!/usr/bin/env bash

greet() {
	echo "Hi there, $1. You are $2"
}


echo "Now, it is time to greet..."
greet Scott 42


numberthing() {
	declare -i i=1
	for f in $@; do
		echo "$i: $f"
		(( i += 1 ))
	done
}


numberthing $(ls /)
numberthing one two three four

