#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

"""
This is a Python script. This script demonstrates the use of conditionals to allow 
fine-grained control over a function's operations. This script takes no arguments and 
prints to the console.
"""

# Module to interface our programme with the operating system
import sys

# Defining functions
def foo_1(x):
    """
    This function returns the square root of x.
    """
    return x ** 0.5

def foo_2(x, y):
    """
    This function returns the greater of two values (x,y).
    """
    if x > y:
        return x
    return y

def foo_3(x, y, z):
    """
    This function calculates if x is greater than y and if y is greater than z. 
    If true it then swaps their values.
    """
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x):
    """
    This function assigns iterates through a loop and multiplies x by each iteration.
    """
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo_5(x):
    """
    This is a recursive function, in that it calls itself within the function, 
    in order to calculate the factorial of x.
    """
    if x == 1:
        return 1
    return x * foo_5(x - 1)
     
def foo_6(x):
    """
    This function calculates the factorial of x.
    """
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

def main(argv):
    print(foo_1(9))
    print(foo_2(100, 99))
    print(foo_3(60, 59, 58))
    print(foo_4(5))
    print(foo_5(10))
    print(foo_6(10))
    return 0

if (__name__ == "__main__"):
    """Makes sure the "main" function is called from command line"""
    status = main(sys.argv)
    sys.exit(status)