#!/bin/bash

# Variables necessary to grab latest remoteDR files
# We need to do 2 things to get the files necessary
# 1. we need to lftp to rbu1 and grab the actual backups
# 2. we need to lftp to ftp server and grab encryption keys

#echo "enter the ip for RBU1"
export RBU1=10.254.254.125
export FTP=10.254.254.123
export LD7=10.255.255.67

export FTPDIR=/home/spcu/ftp/upload
export SFTPDIR=/sftp/spcu/bsdc/spcu/spcu
export LOCALDIR=/home/mruiz/Transfer/tmp
