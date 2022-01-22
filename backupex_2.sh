#!/bin/bash

#Task1: Modify the backup script to add the requested trap
#Task2: Modify the Backup script to contain the requested logic for parameters
#Task3: Run the script and verify the files are backed up as requested
if [ -z "$1" ]; then
    echo "You have failed to pass a parameter. Please try again "
    exit 255;
fi
MYLOGS=$1
function ctrlc {
    rm -rf /home/$USER/work_backup
    rm -rf /home/$USER/$MYLOG
    echo "Recieved Ctrl+C"
    exit 255;
}

trap ctrlc SIGINT

echo "Timestamp before work is done $(date + "%D %T") >> /home/$USER/$MYLOG"
echo "Creating backup directory" >> /home/$USER/$MYLOG
mkdir /home/$USER/work_backup

echo "Copying files" >> /home/$USER/$MYLOG
cp -v /home/$USER/work/* /home/$USER/work_backup >> /home/$USER/$MYLOG
echo "Finished Copying Files" >> /home/$USER/$MYLOG
echo "Timestamp after work is done $(date + "%D %T") >> /home/$USER/$MYLOG"
sleep 15