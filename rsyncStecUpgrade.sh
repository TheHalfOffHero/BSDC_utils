#!/bin/bash
#
#  rsync's over the files from old server to new.
#  
#  Written by: Matt Ruiz
#  
#  Edit Date: 11/12/21      
#        -removed input of ip, we will use oldstec from hostfile. as well as a note that was no longer relevant
#

echo "######################"
echo "syncing over rptarc..."
echo "######################"

rsync -azvh root@oldstec:/rptarc/ /rptarc/

echo "######################"
echo "syncing over stec..."
echo "######################"

rsync -azvh --exclude 'hardware/' root@oldstec:/stec/ /stec/

echo "########################################"
echo "syncing over /stec/hardware/scripting..."
echo "########################################"

mkdir /stec/hardware/scripting
rsync -azvh root@oldstec:/stec/hardware/scripting/ /stec/hardware/scripting/

echo "############################################################"
echo "syncing over stecbi, /usr/dlc/, /etc/reliance.env, /usr/admin/.profile and teller/.profile"
echo "############################################################"

rsync -azvh root@oldstec:/stecbi/ /stecbi/
rsync -azvh root@oldstec:/usr/dlc/ /usr/dlc/
rsync -asvh root@oldstec:/etc/reliance.env /etc/reliance.env
rsync -asvh root@oldstec:/usr/admin/.profile /usr/admin/.profile
rsync -asvh root@oldstec:/usr/teller/.profile /usr/teller/.profile

echo "########################################"
echo "syncing over /tmp/comm and /tmp/relrpt..."
echo "########################################"

rsync -azvh root@oldstec:/tmp/comm/ /tmp/comm/
rsync -azvh root@oldstec:/tmp/relrpt/ /tmp/relrpt/

echo "########################################"
echo "syncing over /root/.ssh/*..."
echo "########################################"

rsync -azvh root@oldstec:/root/.ssh/id* /root/.ssh/

echo "########################################"
echo "syncing over /v10-image/..."
echo "########################################"

rsync -azvh root@oldstec:/v10-image/ /v10-image/
