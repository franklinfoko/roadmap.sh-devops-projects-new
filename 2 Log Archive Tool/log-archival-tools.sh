#!/bin/bash

echo "Log Archive Tool"
echo "----------------"

log_directory=$1

if [ -d /var/log ]
then
    # current_date=$(date +"%Y%m%d_%H%M%S")
    if [ -z $1 ]
    then
        echo "Log directory needed"
    else
        echo "Starting log archival process..."
        sudo tar -czvf $log_directory/log_archive_$(date +"%Y%m%d_%H%M%S").tar.gz  /var/log/*.log
        echo "Archival done"
    fi
else
    echo "Log directory does not exist"
    exit 1
fi
