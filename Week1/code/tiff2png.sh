#!/bin/bash
# Author: Amelia Wake aww3021@imperial.ac.uk
# Script: tiff2png.sh
# Desc: simple shell script to convert a .tif to a .png. Requires 'imagemagick'.
# Arguments: 1 -> .tif
# Date: Oct 2021

# Prompt user to insert correct inputs in order to improve the script.
if [[ $# -eq 0 ]] ; then
    echo 'This script could not be run due to missing or incorrect inputs.'
    exit 0
fi

# 'basename' strips the pathway and extension from a filename in order to add a different
# extension. 
for f in *.tif; 
    do  
        echo "Converting $f"; 
        convert "$f"  "$(basename "$f" .tif).png"; 
    done