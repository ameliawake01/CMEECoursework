#!/usr/bin/env python3

""" 
This is a programme that does extensive maths problems in order to test profiling 
i.e. locate the sections of code where speed bottlenecks exist.
"""

__author__ = 'Amelia Wake (awake21@ic.ac.uk)'
__version__ = '0.0.1'


def my_squares(iters):
    """
    This functions outputs the square of the input.
    """
    out = []
    for i in range(iters):
        out.append(i ** 2)
    return out

def my_join(iters, string):
    """
    This function joins two stings together.
    """
    out = ''
    for i in range(iters):
        out += string.join(", ")
    return out

def run_my_funcs(x,y):
    """
    This function runs the previous functions in the script.
    """
    print(x,y)
    my_squares(x)
    my_join(x,y)
    return 0

run_my_funcs(10000000,"My string")