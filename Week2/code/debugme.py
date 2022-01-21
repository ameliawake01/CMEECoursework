#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

"""
This is a Python script. This script illustrates the importance of unit testing and 
providing feedbacj to the user at each individual calculation; it emphasises the importance 
of 'try' and 'except'. This script takes no arguments and prints to the console.
"""

# Defining the function.
def buggyfunc(x):
    """
    This function is used to test Python's built-in debugger, %pdb.
    """
    y = x
    for i in range(x):
        try: # 'try' tries to do something and if it does not work, transfers control to the except block.
            y = y-1
            z = x/y
        except ZeroDivisionError: # anticipated a ZeroDivisionError and gave feedback.
            print(f"The result of dividing a number by zero is undefined")
        except:
            print(f"This didn't work; x = {x}; y = {y}")
        else: # give feedback on every successful calculation.
            print(f"OK; x = {x}; y = {y}, z = {z};")
    return z

# Calling the function.
buggyfunc(20)