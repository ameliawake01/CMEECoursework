#!/usr/bin/env python3

"""This is a programme that opens a csv file containing species data, iterates through the rows and prints "This is an oak!" when 'Quercus' is identified. It then writes a new csv file containing all of the found Quercus individuals."""

__author__ = 'Amelia Wake (awake21@ic.ac.uk)'
__version__ = '0.0.1'


import csv
import sys
import doctest #debugging

#Define function
def is_an_oak(name):
    """ 
    Returns True if name starts with 'quercus' 
    
    >>> is_an_oak('Fagus sylvatica')
    False
    >>> is_an_oak('Quercuss petraea')
    False
    >>> is_an_oak('Quercus petraea')
    True
    >>> is_an_oak('quercus petraea')
    True
    """
    newname = name.split() #split input into first and second word, split by whitespace
    if (newname[0].lower().startswith('quercus')) and (len(newname[0]) ==7): #if first work of new name (irrespective of upper or lower case) starts with 'quercus' and has a length of 7 characters, return True.
        return True
    else:
        return False

def main(argv): 
    """
    Opens and loops through csv rows, if 'Quercus' is found to be true, prints "Found an Oak!" Creates csv file containing all found Oaks.
    """
    f = open('../data/TestOaksData.csv','r')
    g = open('../data/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
doctest.testmod() #debugging
    
if (__name__ == "__main__"):
    status = main(sys.argv)
