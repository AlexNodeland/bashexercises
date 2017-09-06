#!/bin/bash

#The atoi function in C converts a string character to an integer. 
#Write a shell script function that performs the same operation. 
#Likewise, write a shell script function that does the inverse, 
#mirroring the C itoa function which converts an integer into an ASCII character.

intnum=$1
strnum=
while [ $intnum -gt 0 ]; do
    digiti=$(($intnum % 10))
    intnum=$(($intnum / 10))
    strnum=${digiti}${strnum}
done
echo -e "strnum: $strnum"
