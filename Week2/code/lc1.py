#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

# Defining a list and populating it with species data.
birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

# (1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 
x = [i for i in ["Passerculus sandwichensis", "Delichon urbica", "Junco phaeonotus", "Junco hyemalis", "Tachycineata bicolor"]]
print(x)
y = [i for i in ["Savannah sparrow", "House martin", "Yellow-eyed junco", "Dark-eyed junco", "Tree swallow"]]
print(y)
z = [i for i in ["18.7", "19", "19.5", "19.6", "20.2"]]
print(z)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 
x = ["Passerculus sandwichensis", "Delichon urbica", "Junco phaeonotus", "Junco hyemalis", "Tachycineata bicolor"]
for i in range(len(x)): # explicit loop
    x = x
print(x)
y = ["Savannah sparrow", "House martin", "Yellow-eyed junco", "Dark-eyed junco", "Tree swallow"]
for i in range(len(y)): # explicit loop
    y = y
print(y)
z = ["18.7", "19", "19.5", "19.6", "20.2"]
for i in range(len(z)): # explicit loop
    z = z
print(z)