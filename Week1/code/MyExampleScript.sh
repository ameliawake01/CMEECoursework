#!/bin/bash
# Author: Amelia Wake aww3021@imperial.ac.uk
# Script: MyExampleScript.sh
# Desc: simple shell script to illustrate the use of environmental variables.
# Arguments: none
# Date: Oct 2021

# We can assign separate strings to variables such as MSG1 and MSG2 and echo them together,
# or we can directly write it in one string using an environmental variable.
MSG1="Hello"
MSG2=$USER
echo "$MSG1 $MSG2"
echo "Hello $USER"
echo