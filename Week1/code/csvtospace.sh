#!/bin/sh
# Author: Amelia Wake aw3021@imperial.ac.uk
# Script: csvtospace.sh
# Desc: shell script to convert comma separated values to space separated values
# Arguments: none
# Date: Oct 2021

# Prompt user to insert correct inputs
if [ -r regularfile ]; 
then
content=$(cat regularfile)elif [ -f regularfile ]; 
then 
echo "The file 'regularfile' exists but is not readable to the script."
else
echo "The file 'regularfile' does not exist."
fi

echo "Creating a space delimited version of $1 ..."
cat $1 | tr -s "," " " >> $1.csv
echo "Done!"



exit