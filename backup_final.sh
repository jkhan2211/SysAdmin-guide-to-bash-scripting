#!/bin/bash
# Copy specfic file using RegEx

if [ -z "$1"]; then
    echo "You have failed to pass a parameter. Please try again"
fi


MYLOG=$1
function ctrlc {
    rm -rf /home/$USER/work_backup
    rm -f /home/$USER/$MYLOG
    echo "Recieved Ctrl+C"
    exit 255
}

trap ctrlc SIGINT

echo "Timestamp before work is done $(date + "%D %T")" >> /home/$USER/$MYLOG
echo "Creating backup directory" >> /home/$USER/$MYLOG
mkdir /home/$USER/work_backup

echo "Copying Files" >> /home/$USER/$MYLOG
for i in $(ls work | grep -E 'adent|financ')
do 
    cp -v /home/$USER/work/$i /home/$USER/work_backup/ >> /home/$USER/$MYLOG
done
echo "Finished copying files" >> /home/$USER/$MYLOG
echo "Timestamp after work is done $(date + "%D %T")" >> /home/$USER/$MYLOG

