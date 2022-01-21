#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

#############################
# FILE INPUT
#############################
# Open a file for reading.
f = open('../sandbox/test.txt', 'r')

# Use "implicit" for loop - implicit because stating the range of things in f to loop over in
# this way allows Python to handle any kind of objects to loop through.
# If the object is a file, python will cycle over lines.
for line in f:
    print(line)

# Close the file.
f.close()

# Same example, skip blank lines.
f = open('../sandbox/test.txt', 'r')
for line in f:
    if len(line.strip()) > 0: # strip the line if the length of the line equals zero.
        print(line)

f.close()

