#!/bin/bash

#Task1: Modify the backup.sh script to use variables
# - Use the given backup script as the base and modify it to use variable for user directory

#Task2: Add a Parameter to determine the name of the log file
# - Modify the log file usage to use a command line parameter 

#Task3: Run the script in each user's home directory to ensure it works 

MYLOGS=$1
echo "Creating backup directory" >> /home/$USER/$MYLOG
mkdir /home/$USER/work_backup

echo "Copying files" >> /home/$USER/$MYLOG
cp -v /home/$USER/work/* /home/$USER/work_backup >> /home/$USER/$MYLOG
echo "Finished Copying Files" >> /home/$USER/$MYLOG