#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

"""
This is a Python script. This script demonstrates how to write a python script to poulate 
a dictionary and return keys and values stored as tuples. This script takes no arguments 
and prints to the console.
"""

taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a short python script to populate a dictionary called taxa_dic 
# derived from  taxa so that it maps order names to sets of taxa.
taxa_dic = {'Chiroptera': ['Myotis lucifungus'], 
        'Rodentia': ['Gerbillus henleyi','Peromyscus crinitus','Mus domesticus','Cleithrionomys rutilus'], 
        'Afrosoricida': ['Microgale dobsoni', 'Microgale talazaci'], 
        'Carnivora': ['Lyacon pictus', 'Arctocephalus gazella', 'Canis lupus']}

# For this we use a method called .items(). This analyses a dictionary and returns keys and values stored as tuples.
for key, value in taxa_dic.items():
        print("Key:",key)
        print("Value:",str(value))