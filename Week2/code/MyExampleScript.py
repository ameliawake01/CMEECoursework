#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

# In Python, you delineate a function by using indentation. Functions that are defined 
# like this are stored in memory and can be called at a later date if and when needed.
# The 'print' command outputs the value of x to the terminal, we would need a return statement 
# if we wanted to capture and store the value.
def foo(x):
    """
    This function multiplies a number by itself.
    """
    x *= x # same as x = x*x
    print(x)

# Calling the function after it has been defined.
foo(2)