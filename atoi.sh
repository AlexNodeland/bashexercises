#!/bin/bash

#The atoi function in C converts a string character to an integer. 
#Write a shell script function that performs the same operation. 
#Likewise, write a shell script function that does the inverse, 
#mirroring the C itoa function which converts an integer into an ASCII character.

strnum=$1
pow=$((${#strnum}-1))
for ((i=0; i<=pow; i++)); do
    digiti=${strnum:$i:1}
    exp=$((pow-i))
    mult=$((10**exp))
    part=$((digiti*mult))
    intnum=$((intnum+part))
done
echo -e "intnum: $intnum\ndouble intnum: $(($intnum*2))"
