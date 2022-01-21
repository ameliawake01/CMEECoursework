#!/usr/bin/env python3

"""
This script is a simple boilerplate to illustrate the appropriate structure of a Python 
programme.
"""

__appname__ = 'boilerplate.py'
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"

"""
This is a simple Python boilerplate. This script illustrates the appropriate structure of a 
Python programme. This script takes no arguments and does not output anything. This script 
requires an additional package: 'sys'.
"""

# Module to interface our program with the operating system.
import sys 

## constants ##


## Defining functions ##
def main(argv):
    """ 
    Main entry point of the programme. 
    """
    print('This is a boilerplate') # NOTE: indented using two tabs or 4 spaces
    return 0

if __name__ == "__main__": 
    """
    Makes sure the "main" function is called from command line.
    """  
    status = main(sys.argv)
    sys.exit(status)