#!/usr/bin/env bash

for i in 1 2 3
do
	echo "$i"
done

echo "##########"

for i in {1..10}
do
	echo "$i"
done

echo "##########"

for (( i=1; i < 10; i++ ))
do
	echo "$i test"
done

echo "##########"

for i in $(ls)
do
	echo "$i was found"
done
