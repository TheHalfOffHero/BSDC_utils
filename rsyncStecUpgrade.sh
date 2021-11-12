#!/bin/bash
#
# 
#  rsync's over the files from old server to new.
#  We are currently syncing the following directories
#
#  	/rptarc/		/stec/hardware/scripting
#  	/stec/			/stecbi/
#	/usr/dlc/		/etc/reliance.env
#	/usr/admin/.profile	/usr/teller/.profile
#	/tmp/comm/		/tmp/relrpt
#	/root/.ssh/id*		/v10-image/
#  
#  Edit Date: 11/12/21, Matt Ruiz      
#        -removed input of ip, we will use oldstec from hostfile.
#        

rsync -azvh root@oldstec:/rptarc/ /rptarc/

rsync -azvh --exclude 'hardware/' root@oldstec:/stec/ /stec/

mkdir /stec/hardware/scripting
rsync -azvh root@oldstec:/stec/hardware/scripting/ /stec/hardware/scripting/

rsync -azvh root@oldstec:/stecbi/ /stecbi/

rsync -azvh root@oldstec:/usr/dlc/ /usr/dlc/

rsync -asvh root@oldstec:/etc/reliance.env /etc/reliance.env

rsync -asvh root@oldstec:/usr/admin/.profile /usr/admin/.profile

rsync -asvh root@oldstec:/usr/teller/.profile /usr/teller/.profile

rsync -azvh root@oldstec:/tmp/comm/ /tmp/comm/

rsync -azvh root@oldstec:/tmp/relrpt/ /tmp/relrpt/

rsync -azvh root@oldstec:/root/.ssh/id* /root/.ssh/

rsync -azvh root@oldstec:/v10-image/ /v10-image/
