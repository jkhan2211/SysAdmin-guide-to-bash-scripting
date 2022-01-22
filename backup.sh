#! /bin/bash

# Task1: Write a script fpr the $USER user that will backup files in ~/work
# and put them in ~/work_backup
# Tasl2: Run the script and verify the files requested are backed as requested 

echo "Creating backup directory" >> /home/$USER/$MYLOG
mkdir /home/$USER/work_backup

echo "Copying files" >> /home/$USER/$MYLOG
cp -v /home/$USER/work/* /home/$USER/work_backup >> /home/$USER/$MYLOG
echo "Finished Copying Files" >> /home/$USER/$MYLOG