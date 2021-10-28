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

# For this we use a method called items(). This analyses a dictionary and returns keys and values stored as tuples.
for key, value in taxa_dic.items():
        print("Key:",key)
        print("Value:",str(value))

# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc.
#  OR,
# 'Chiroptera': {'Myotis lucifugus'} ... etc
