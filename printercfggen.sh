#!/bin/bash
# Script: printercfggen.ss
# Author: Matthew Ruiz
# Date: 8/18/2021
# Purpose: Create the printers.cfg file for use with the printerimport.ss script
#
#
#	lpstat -s | sed -nr "/default/d;s/.*for\s(\w*(ps|tx|vchr|ck)\w*).*?\/\/([^\/]*).*/\2,\3,\1/;s/(vchr|ck)/tx/;p"
#
#	Note: commands seperated by ; first says we don't want to print using lp. Second will look for "for and grab entry following next space. second selection group
#		  is the tx|ps|vchr|ck 

lpstat -s | sed -nr "/default/d;s/.*for\s(\w*(ps|tx|vchr|ck)\w*).*?\/\/([^\/]*).*/\2,\3,\1/;s/(vchr|ck)/tx/;p" > printers.cfg
#extra echo to append a new line
echo "" >> printers.cfg

echo "Please review the printers.cfg file. Some of the entries will need to be finished. This will likely be devices that do not follow our standards for naming"