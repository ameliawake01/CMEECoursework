#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

# Module to interface our program with the operating system.
import sys

# Printing strings to console, using command-line arguments.
# When 'sys' has been imported, all command-line arguments (argv) must be referred to
# as sys.argv later on in the script.
# 'argv' is a variable that holds the argument you pass to your Python script when you run it.
# sys.argv is simply an object created by Python using the sys module
print("This is the name of the script: ", sys.argv[0])
print("Number of arguments: ", len(sys.argv))
print("The arguments are: " , str(sys.argv))