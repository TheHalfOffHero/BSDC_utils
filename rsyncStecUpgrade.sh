#!/bin/bash

echo "Enter the Original Stec's IP: "
read OrigStecIP

echo "######################"
echo "syncing over rptarc..."
echo "######################"

rsync -azvh root@$OrigStecIP:/rptarc/ /rptarc/

echo "######################"
echo "syncing over stec..."
echo "######################"

rsync -azvh --exclude 'hardware/' root@$OrigStecIP:/stec/ /stec/

echo "########################################"
echo "syncing over /stec/hardware/scripting..."
echo "########################################"

mkdir /stec/hardware/scripting
rsync -azvh root@$OrigStecIP:/stec/hardware/scripting/ /stec/hardware/scripting/

echo "###########################################################################################"
echo "syncing over stecbi, /usr/dlc/, /etc/reliance.env, /usr/admin/.profile and teller/.profile"
echo "###########################################################################################"

rsync -azvh root@$OrigStecIP:/stecbi/ /stecbi/
rsync -azvh root@$OrigStecIP:/usr/dlc/ /usr/dlc/
rsync -asvh root@$OrigStecIP:/etc/reliance.env /etc/reliance.env
rsync -asvh root@$OrigStecIP:/usr/admin/.profile /usr/admin/.profile
rsync -asvh root@$OrigStecIP:/usr/teller/.profile /usr/teller/.profile

echo "########################################"
echo "syncing over /tmp/comm and /tmp/relrpt..."
echo "########################################"

rsync -azvh root@$OrigStecIP:/tmp/comm/ /tmp/comm/
rsync -azvh root@$OrigStecIP:/tmp/relrpt/ /tmp/relrpt/

echo "########################################"
echo "syncing over /root/.ssh/*..."
echo "########################################"

rsync -azvh root@$OrigStecIP:/root/.ssh/id* /root/.ssh/

echo "########################################"
echo "syncing over /v10-image/..."
echo "########################################"

rsync -azvh root@$OrigStecIP:/v10-image/ /v10-image/
