#!/bin/bash

# Backing up required files

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
cleanup () {
    rm -rf $BACKUP_TARGET
    echo "RECIEVED CTRLC" >> /home/$USER/$LOGFILE
}

init
trap cleanup SIGINT

#echo "Copying Files" && cp -v $BACKUP_LOC $BACKUP_TARGET >> $LOGFILE 2>&1

echo "Copying Files"
cd $BACKUP_LOC
for i in $(ls); do
        cp -v $i $BACKUP_TARGET/"$i" -backup >> /home/$USER/$LOGFILE 2>&1
done
grep -i denied /home/$USER/$LOGFILE | tail 2
exit 127