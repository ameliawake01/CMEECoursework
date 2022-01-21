#!/bin/bash
# Author: Amelia Wake aww3021@imperial.ac.uk
# Script: CountLines.sh
# Desc: simple shell script to count the number of lines in a file.
# Arguments: 1 -> .txt
# Date: Oct 2021

# Prompt user to insert correct inputs in order to improve the script.
if [[ $# -eq 0 ]] ; then
    echo 'This script could not be run due to missing or incorrect inputs.'
    exit 0
fi

# The '<' redirects the contents of the file to the standard input of the command wc -l.
# Without it you would not be able to catch just the numerical output (number of lines).
NumLines=`wc -l < $1`

# Echoing the string to console. 
echo "The file $1 has $NumLines lines"
echo