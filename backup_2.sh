#!/bin/bash

# Backing up required files

LOGFILE="/home/$USER/log_file"

echo "Creating backup directory" && mkdir ~/backup 2> /dev/null || echo "Directory already exists"

echo "Copying Files" && cp -v /usr/bin/* ~/backup > $LOGFILE 2>&1

grep -i denied log_file | tail -n 2

exit 127