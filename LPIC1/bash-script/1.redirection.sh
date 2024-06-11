#!/bin/bash

#stderr and stdout:
ls /notreal 1>output.txt 2>error.txt

#hear document:
cat << EndOfText
this is a
multiline
text string
EndOfText

