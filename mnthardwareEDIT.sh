#!/bin/bash
#----------------------------------------------------------------------------
#     Script: mnthardware.sh
#       Date: 1/1/2016
# Programmer: Jason Smith BSDC
#
#    Purpose: Mount hardare directory at service bureau
#
# Last Modified: JRB 01-08-20 BSDC
#        Reason: Making it a readonly mount
#
#  Last Modified: JRB 04-30-20 BSDC
#        Reason: Mounting /hardware/Hardware_Scripts/Windows/BSDC_Programs to
#                /install/BSDC_Programs
#
#  Last Modified: JRB 12-03-20 BSDC
#        Reason: Updating for our new /hardware mount server
#
#  Last Modified: JRB 12-14-20 BSDC
#        Reason: Using Bind to mount /install/BSDC_Programs
#
#  Last Modified: JRB 02-26-21 BSDC
#        Reason: Not using BIND anymore, seems to unmount too often
#----------------------------------------------------------------------------

mkdir /hardware

MNTCHK=`df -v |grep hardware`
MNTCHK2=`mount |grep install`
IPCHECK=`ifconfig | gawk 'match($0, /172.([0-9][0-9])/, a) {print a[1]}'`

if [ "$MNTCHK" ]
then
    echo "The /hardware directory is already mounted!"
    echo $MNTCHK	
else
	if [ "$IPCHECK" -eq 20 ]	
	then
		# Mount the directories
		echo "This server is AKR"
		#mount -t cifs -o ro,username=bsdchardware,password=bsdchardware@123 //hwmount/bsdchardware /hardware
	else
		echo "This server is MSP"
		#mount -t cifs -o ro,username=bsdchardware,password=bsdchardware@123 //hwmount/hardware /hardware
	fi
fi	
	
if [ "$MNTCHK2" ]
then
	echo "The /install/BSDC_Programs directory is already mounted!"
	echo $MNTCHK2
else
	if [ "$IPCHECK" -eq 20  ]
	then
		echo "This server is AKR"
		#mount -t cifs -o ro,username=bsdchardware,password=bsdchardware@123 //hwmount/bsdchardware/Hardware_Scripts/Windows/BSDC_Programs /install/BSDC_Programs
	else
		echo "This server is MSP"
		#mount -t cifs -o ro,username=bsdchardware,password=bsdchardware@123 //hwmount/hardware/Hardware_Scripts/Windows/BSDC_Programs /install/BSDC_Programs
	fi
fi
