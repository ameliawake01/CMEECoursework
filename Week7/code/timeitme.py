"""
This script is comparing the most efficient ways to do something specific, like 
squaring numbers and joining strings together (these have been imported from
profileme.py), as part of a larger programme.
""" 

##############################################################################
# loops vs. list comprehensions: which is faster?
##############################################################################

iters = 1000000

import timeit

from profileme import my_squares as my_squares_loops

from profileme2 import my_squares as my_squares_lc

##############################################################################
# loops vs. the join method for strings: which is faster?
##############################################################################

mystring = "my string"

from profileme import my_join as my_join_join

from profileme2 import my_join as my_join

#this script is comparing the most efficient ways to do something specific, like squaring numbers and joining strings together, these have been imported from profileme.py. 
