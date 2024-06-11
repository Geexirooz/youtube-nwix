#!/usr/bin/env bash

#while getopts u:p: option; do
#	case $option in
#		u) user=$OPTARG;;
#		p) pass=$OPTARG;;
#	esac
#done
#
#echo -e "user: $user\npass: $pass"

#if you dont put colon after the options -> you can check if an option is given or not:
#It is used to enable/disable a feature
#while getopts u:p:ab option; do
#	case $option in
#		u) user=$OPTARG;;
#		p) pass=$OPTARG;;
#		a) echo "got the A flag";;
#		b) echo "got the B flag";;
#	esac
#done
#
#echo -e "user: $user\npass: $pass"



#If you add colon at the very begining, you can catch the options given in the command line that your script does not support
#It is used to help the user
while getopts :u:p:ab option; do
	case $option in
		u) user=$OPTARG;;
		p) pass=$OPTARG;;
		a) echo "got the A flag";;
		b) echo "got the B flag";;
		?) echo "I don't know what $OPTARG is!";;
	esac
done

echo -e "user: $user\npass: $pass"
