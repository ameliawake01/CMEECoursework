#!/bin/bash
# Author: Amelia Wake aw3021@imperial.ac.uk
# Script: csvtospace.sh
# Desc: simple shell script to convert comma separated values to space separated values file.
# Arguments: 1 -> .csv
# Date: Oct 2021

# Prompt user to insert correct inputs in order to improve the script.
if [[ $# -eq 0 ]] ; then
    echo 'This script could not be run due to missing or incorrect inputs.'
    exit 0
fi

# Case...esac is a more efficient solution than multiple if...elif statements, 
# especially if they all depend on the value of a single variable.
case "$1" in
    1) echo 'Sufficient inputs have been provided. This script will now run.' ;;
    *) echo 'Sufficient inputs have been provided. This script will now run.' ;;
esac

# Creating space delimited version and removing extra extensions.
echo "Creating a space delimited version of $1 ..."
cat $1 | tr -s "," " " >> `basename -s .csv $1`.txt
echo "Done!"

exit