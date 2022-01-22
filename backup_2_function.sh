#!/bin/bash

# Backing up required files

if [ -z $1 ]
then
        echo "You need to supply a parameter for the logfile"
        exit 255
fi

LOGFILE=$1
BACKUP_LOC="/usr/bin/*"
BACKUP_TARGET="/home/$USER/backup"

#function init {...}
init () {
    if [ -d $BACKUP_TARGET ]
        then
            echo "Directory already exists"
            echo "$(date + "%x %r %Z") " >> $LOGFILE
            return 1
        else
            mkdir $BACKUP_TARGET
            echo "$(date + "%x %r %Z")" >> $LOGFILE
            return 0
}

tail () {
    command tail -n $1
}


cleanup () {
    rm -rf $BACKUP_TARGET
    echo "RECIEVED CTRLC" >> /home/$USER/$LOGFILE
    exit
}

if (init)
then
    echo "Directory did not exist"
else
    echo "Directory did exists" 
    
trap cleanup SIGINT

#echo "Copying Files" && cp -v $BACKUP_LOC $BACKUP_TARGET >> $LOGFILE 2>&1

echo "Copying Files"
cd $BACKUP_LOC
for i in $(ls); do
        cp -v $i $BACKUP_TARGET/"$i" -backup >> /home/$USER/$LOGFILE 2>&1
done
grep -i denied /home/$USER/$LOGFILE | tail 2
exit 127