#!/bin/bash

#Task1: Modify the backup script as requested


#Task2: Run the script and verify the files are backed up as requested



MYLOGS=$1

echo "Timestamp before work is done $(date + "%D %T") >> /home/$USER/$MYLOG"
echo "Creating backup directory" >> /home/$USER/$MYLOG
mkdir /home/$USER/work_backup

echo "Copying files" >> /home/$USER/$MYLOG
cp -v /home/$USER/work/* /home/$USER/work_backup >> /home/$USER/$MYLOG
echo "Finished Copying Files" >> /home/$USER/$MYLOG
echo "Timestamp after work is done $(date + "%D %T") >> /home/$USER/$MYLOG"