#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
matrix = [[("JAN", 111.4)], [("FEB", 126.1)], [("AUG", 140.2)], [("NOV", 128.4)], [("DEC", 142.2)]]
flattened_matrix = [n for row in matrix for n in row]
print(flattened_matrix)

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 
matrix = [[("MAR", 49.9)], [("SEP", 27.0)]]
flattened_matrix = [n for row in matrix for n in row]
print(flattened_matrix)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 
matrix = [[("JAN", 111.4)], [("FEB", 126.1)], [("AUG", 140.2)], [("NOV", 128.4)], [("DEC", 142.2)]]
flattened_matrix = []
for row in matrix:
    for n in row:
        flattened_matrix.append(n)
print(flattened_matrix)

matrix = [[("MAR", 49.9)], [("SEP", 27.0)]]
flattened_matrix = []
for row in matrix:
    for n in row:
        flattened_matrix.append(n)
print(flattened_matrix)

# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.
