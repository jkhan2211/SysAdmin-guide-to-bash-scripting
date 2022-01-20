#! /bin/bash

# Task1: Write a script fpr the cloud_user user that will backup files in ~/work
# and put them in ~/work_backup
# Tasl2: Run the script and verify the files requested are backed as requested 

echo "Creating backup directory" >> /home/cloud_user/backup_logs
mkdir /home/cloud_user/work_backup

echo "Copying files" >> /home/cloud_user/backup_logs
cp -v /home/cloud_user/work/* /home/cloud_user/work_backup >> /home/cloud_user/backup_logs
echo "Finished Copying Files" >> /home/cloud_user/backup_logs