#!/bin/bash

#INPUT: Line separated list of numbers
#    First number (N) denotes the number of lines to follow, 1<=N<=500
#    The data elements (x) should be -10,000<x<10,000
#OUTPUT: Average of all N elements in the list, printed to stdout
#    Round output to 3 digits after the decimal
#    Include trailing zeros

N=$1
ARRAY=$@
sum=0
for element in ${ARRAY[@]}; do
    sum=$(($sum+$element))
done
sum=$(($sum-$N))
avg=$(($sum/($N)))
echo "$avg"
