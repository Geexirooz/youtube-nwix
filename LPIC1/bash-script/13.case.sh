#!/usr/bin/env bash

animal="dog"

case $animal in
	cat) echo "Feline";;
	dog|puppy) echo "Canine";;
	*) echo "No match";;
esac
