#!/usr/bin/env python3

""" 
This programme is doing the same functions as profileme.py however it has 
converted the loop to a list comprehension and replaced the .join with an explicit 
string concatenation.
"""


def my_squares(iters):
    """
    This functions outputs the square of the input.
    """
    out = [i ** 2 for i in range(iters)]
    return out

def my_join(iters, string):
    """
    This function joins two stings together.
    """
    out = ''
    for i in range(iters):
        out += ", " + string
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