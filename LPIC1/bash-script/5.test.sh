#!/usr/bin/env bash


#To check if a file exists or it is a directory etc.
[...]

#To see all possibilities:
help test


[ "cat" = "cat" ]
[ 4 -lt 3 ]
[ ! 4 -lt 3 ]



####Extended test:
[[...]]


[[ -d ~ && -a /bin/bash ]]


[[ -d ~ || -a /bin/bash ]]


[[ -d ~ ]] && echo ~ is a directory


#regex test
[[ "cat" =~ c.* ]]
