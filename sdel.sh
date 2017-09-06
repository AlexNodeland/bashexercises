#!/bin/bash

#Pass filenames as command line arguments
#gzip/tar the files and move them to a ~/TRASH directory
#Run cron job to clean ~/TRASH directory every 48 hours

TRASH=${HOME}/.SDEL_TRASH

if [ -f ${TRASH} ]; then
    echo "$0: Get rid of the file, $TRASH"
    exit -1
fi
mkdir -p $TRASH

for file in "$@"; do
        full_dir=$(pwd)/${file}
    if [ ! -e ${full_dir} ]; then
        echo "$0: File, ${full_dir}, does not exist"
        exit -1
    fi
    if [ ! -d $full_dir ]; then
        gzip $full_dir
        mv ${full_dir}.gz ${TRASH}/
    else
        tar -zcvf ${full_dir::-1}.tar.gz ${full_dir}
        rm -rf ${full_dir}
        mv ${full_dir::-1}.tar.gz ${TRASH}/
    fi
done
echo "SUCCESS!"
