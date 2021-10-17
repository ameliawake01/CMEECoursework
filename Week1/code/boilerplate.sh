#!/bin/bash
#Author: Amelia Wake aww3021@imperial.ac.uk
#Script: boilerplate.sh
#Desc: simple boilerplate for shell scripts
#Arguments: none
#Date: Oct 2021

echo -e "\nThis is a shell script! \n"

#exit
echo "Remove   excess    spaces." | tr -s " "
echo "remove all the a's" | tr -d "a"
echo "set to uppercase" | tr [:lower:] [:upper:]
echo "10.00 only numbers 1.33" | tr -d [:alpha:] | tr -s " " ","

