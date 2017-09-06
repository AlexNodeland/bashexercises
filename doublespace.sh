#!/bin/bash

#Write a script that reads each line of a target file, then writes the line back to stdout,
#but with an extra blank line following. This has the effect of double-spacing the file.
#Include all necessary code to check whether the script gets the necessary command-line argument (a filename), and whether the specified file exists.
#When the script runs correctly, modify it to triple-space the target file.
#Finally, write a script to remove all blank lines from the target file, single-spacing it.

TARGET="$1"

if [ -z "$TARGET" ]; then
      echo "$0: Please enter a file name."
elif [ ! -f "$TARGET" ]; then
    echo "$0: File '${TARGET}' not found."
fi

lines=$(wc -l $TARGET | awk '{print $1;}')

for ((i=1;i<=($lines);i++)); do
    sed "$i q;d" $TARGET
    echo -e "\n"
done
