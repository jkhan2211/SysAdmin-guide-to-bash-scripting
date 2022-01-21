#!/bin/bash

# Backing up required files
# Command Substitution

LOGFILE=$1
BACKUP_LOC="/usr/bin/*"
BACKUP_TARGET="/home/$USER/backup"

#function init {...}
init () {
    echo "Creating backup directory" && mkdir $BACKUP_TARGET 2> /dev/null || echo "Directory already exists"
    echo "$(date +"%x %r %Z")" > $LOGFILE
    local CLOUDGURU=37
}

tail () {
    command tail -n $1
}

init 
echo "Copying Files" && cp -v $BACKUP_LOC $BACKUP_TARGET >> $LOGFILE 2>&1

grep -i denied $LOGFILE | tail 2

exit 127