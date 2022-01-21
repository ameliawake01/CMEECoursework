#!/bin/bash
# Author: Amelia Wake aww3021@imperial.ac.uk
# Script: ConcatenateTwoFiles.sh
# Desc: simple shell script to concatenate two files.
# Arguments: 2
# Date: Oct 2021

# Prompt user to insert correct inputs to improve the script.
if [[ $# -eq 0 ]] ; then
    echo 'This script could not be run due to missing or incorrect inputs.'
    exit 0
fi

# 'cat' is often used for viewing, creating and appending files. In this case, we are
# appending both $1 and $2 to $3 in order to merge the two files in to one. 
cat $1 > $3
cat $2 >> $3

# Echoing the string to console. 
echo "Merged File is: "
cat $3