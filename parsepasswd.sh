#!/bin/bash

TARGET="/etc/passwd"
if [ ! -e "$TARGET" ]; then
    echo "$0: $TARGET does not exist in this location"
    exit -1
fi
while IFS=: read line; do
    IFS=':' read -r -a array <<< "$line"
    for element in "${array[@]}"; do
        elipse=""
        if [ ${#element} -gt 10 ]; then
            elipse="..."
        fi
        printf '%s%s\t\t' "${element:0:4}" "$elipse"
    done
    printf '\n'
done <$TARGET
