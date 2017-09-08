#!/bin/bash

#INPUT: Line separated list of numbers
#    First number (N) denotes the number of lines to follow, 1<=N<=500
#    The data elements (x) should be -10,000<x<10,000
#OUTPUT: Average of all N elements in the list, printed to stdout
#    Round output to 3 digits after the decimal
#    Include trailing zeros

#Set variables
N=$1
NMAX=500
NMIN=1
XMAX=10000
XMIN=-10000
ARRAY="$@"
sum=0
IFS=$'\n'
echo "${ARRAY[*]:2}" | sort -nr | head -n1
exit

#Check if bounds are satisfied for N value
if [[ $N -gt $NMAX ]] || [[ $N -lt $NMIN ]]; then
    echo "$0: Please enter i1-500 elements"
    exit -1
fi

#Check if bounds are satisfied for x values
if [[ $MIN -lt $XMIN ]] || [[ $MAX -gt $XMAX ]]; then
    echo "$0: Please enter only elements between -10,000-10,000"
    exit -1
fi

#Calculate sum
for element in ${ARRAY[@]}; do   #Iterate through all elements of array
    sum=$(($sum+$element))       #"+=" is not a valid expression in BASH
done

sum=$(($sum-$N))    #Remove first element
avg=$(($sum/($N)))  #Calculate average  
echo "$avg"         #Print average to stdout
