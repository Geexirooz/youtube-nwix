echo -e "\033[33;44mColor Text\033[0m"
echo -e "\033[91;100mColor Text\033[0m"



#the colors' numbers can be found online
#you can change its style as well like doing 'dim', 'blinking', 'italic', etc.


#To do it efficiently in scripts:

underlinedred="\033[4;31;40m"
red="\033[31;40m"
none="\033[0m"
echo -e $underlinedred"ERROR:"$none$red" Something went wrong."$none
