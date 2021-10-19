#!/bin/bash

##########################################
#        written by Matt R.
#
#        Purpose is to check for presence of rsa keys
#
#        edit Matt Ruiz, 03/05/2021 -- sendEmail has to be called with absolute path when run from cron
#			    Also added $CU variable for future techs ease of use
#
#		 
#########################################


#######  [ Variables ] ############

FILE=/root/.ssh/id_rsa
DATE=`date +"%m%d%y"`
TIME=`date +"%D %T"`
CU=Metco

LOGFILE=/transfer/matt/fileCheckLogs/"rsa_Check_$DATE.log"

EMAIL_FLAG="email sent"

#####  [ Logic ] ################

if [ -f "$FILE" ];
 then
	echo "$TIME --  $FILE exists" >> $LOGFILE
 else
	echo "$TIME -- $FILE is no longer there" >> $LOGFILE
	
	#Another if statement to send me an email should the script find the rsa key is missing
	if ! grep -q "$EMAIL_FLAG" $LOGFILE; then
		/stec/bsdc/sendEmail -f cusupport@bradfordscott.com -t mruiz@bradfordscott.com -u "$CU RSA key deleted" -m "The RSA key was deleted from $CU -- $TIME" -s bsdccumail.bsdc.us -xu bsdccu -xp union.09
		echo "$EMAIL_FLAG" >> $LOGFILE
	fi	
 fi
