#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

"""
This is a Python script. This script illustrates how to extract information from a nested 
tuple and output this information line by line. This script takes no arguments and prints 
to the console.
"""

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Birds is a tuple of tuples of length three: latin name, common name, mass.
# Write a (short) script to print these on a separate line or output block by species 
a = [i for i in ["Passerculus sandwichensis", "Savannah sparrow", "18.7"]]

b = [i for i in ["Delichon urbica", "House martin", "19"]]

c = [i for i in ["Junco phaeonotus", "Yellow-eyed junco", "19.5"]]

d = [i for i in ["Junco hyemalis", "Dark-eyed junco", "19.6"]]

e = [i for i in ["Tachycineata bicolor", "Tree swallow", "20.2"]]

for x in birds:
    print("Latin name: ", a[0], "   Common name: ", a[1], "   Mass: ", a[2])
    break
for x in birds:
    print("Latin name: ", b[0], "             Common name: ", b[1], "       Mass: ", b[2])
    break
for x in birds:
    print("Latin name: ", c[0], "            Common name: ", c[1], "  Mass: ", c[2])
    break
for x in birds:
    print("Latin name: ", d[0], "              Common name: ", d[1], "    Mass: ", d[2])
    break
for x in birds:
    print("Latin name: ", e[0], "        Common name: ", e[1], "       Mass: ", e[2])
    break