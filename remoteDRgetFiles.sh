#!/bin/bash

# First step is to source the variables file
source '/home/mruiz/Scripts/BSDC_utils/varfiles/getDRfilesvars.sh'

echo $LOCALDIR

#Then we want to lftp to sftp server and grap the remote backup files
echo "enter the username for sftp server"
read SFTPUSER

echo "Enter the password for sftp server"
read SFTPPASS

#Then we lftp and grab the Backup files
lftp -u $SFTPUSER,$SFTPPASS sftp://$RBU1 << EOF
cd $SFTPDIR
lcd $LOCALDIR
mirror --parallel=5
exit
EOF

echo "Enter ld box username"
read LDUSER

echo "Enter ld box password"
read LDPASS

#lftp to the dr server and push the dr files to transfer directory
lftp -u $LDUSER,$LDPASS sftp://$LD7 << EOF
lcd $LOCALDIR
cd /transfer
mput *
exit
EOF



