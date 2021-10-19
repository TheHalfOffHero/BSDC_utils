#!/bin/bash

#----------------------------------------------------
#        written by Matt R.
#
#        Purpose is to check for presence of rsa keys
#
#        last edit: 1/8/21
#----------------------------------------------------


#--------------[ Variables ]------------------------

#FILE=/root/.ssh/id_rsa
FILE=/transfer/test.txt
DATE=`date +"%m%d%y"`
TIME=`date +"%D %T"`

LOGFILE=/mattSpecialFolder/"rsa_Check_$DATE.log"

EMAIL_FLAG="email sent"

#-----------[ Logic ]------------------------------
#First check if the file exists and write result to file. If it doesn't send an email and write to file so we don't send more than 1 email
if [ -f "$FILE" ];
 then
	echo "$TIME --  $FILE exists" >> $LOGFILE
 else
	echo "$TIME -- $FILE is no longer there" >> $LOGFILE
	
	#Another if statement to send me an email should the script find the rsa key is missing
	if ! grep -q "$EMAIL_FLAG" $LOGFILE; then
		sendEmail -f cusupport@bradfordscott.com -t mruiz@bradfordscott.com -u "CU RSA key deleted" -m "The RSA key was deleted from CU_Placeholder" -s bsdccumail.bsdc.us -xu bsdccu -xp union.09
		echo "$EMAIL_FLAG" >> $LOGFILE
	fi	
 fi
