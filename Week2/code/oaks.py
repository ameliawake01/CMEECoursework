#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

## Finds just those taxa that are oak trees from a list of species

taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea',
       ]

def is_an_oak(name):
    """
    This function returns a species name if it begins with 'quercus'.
    """
    return name.lower().startswith('quercus ')

## Using for loops
# 'set()' is used to store multiple items in a single variable and is initialised outside
# of the for loop. The for loop iterates through the species in the taxa list and uses
# 'is_an_oak' to identify and add these species to oaks_loops.
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species)
print(oaks_loops)

## Using list comprehensions 
# Behaves as above, however, list comprehensions can make code run more slowly and 
# use more memory in some cases, as well as lessening code readability.   
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

## Get names in UPPER CASE using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper())
print(oaks_loops)

## Get names in UPPER CASE using list comprehensions
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)