#!/bin/bash
# Author: Amelia Wake aw3021@ic.ac.uk
# Script: tabtocsv.sh
# Description: shell script to substitute tabs with commas and save the output to a .csv file.
# Arguments: 1 -> tab delimited file
# Date: Oct 2021

# Prompt user to insert correct inputs in order to improve the script.
if [[ $# -eq 0 ]] ; then
    echo 'This script could not be run due to missing or incorrect inputs.'
    exit 0
fi

# Echoing string to the console.
echo "Creating a comma delimited version of $1 ..."

# $1 is the way that a shell script defines a placeholder for a variable 
# (in this case the filename).
# The new file is saved in the same location as the original due to a pathway
# not being specified.
cat $1 | tr -s "\t" "." >> $1.csv

# Echoing string to the console when finished. 
echo "Done!"
exit