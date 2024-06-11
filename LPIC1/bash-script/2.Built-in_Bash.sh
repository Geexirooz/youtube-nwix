#!/bin/bash

echo Some text

printf "some text"

#to check if a tool is built-in or not:
command -V df
command -V echo

#To run the built-in version:
builtin echo hello
#To run the third-party version:
command echo hello


#To disable built-in version:
enable -n echo
#To enable:
enable echo


#help:
#To see all built-in:
help
#To see built-in help:
help echo
