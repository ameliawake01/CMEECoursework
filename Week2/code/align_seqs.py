#!/usr/bin/env python3

__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

"""
This is a Python script. This script aligns two DNA sequences such that they are as similar
as possible. The alignment with the highest score is saved. This script takes no arguments
from the command line. This script takes the DNA sequences as an input from a single 
external file in the data directory and outputs a .txt file to the results directory.
"""

# Import relevant modules
import sys
import csv

# Write a function that reads in a file, trims off the header and new lines, and 
# returns just the sequence data.
def read_csv():  
    """
    A function to read a CSV file.
    """
    with open('../data/align_seqs.csv','r') as f:
        
        csvread = csv.reader(f)
        temp = []
        for row in csvread:
            temp.append(tuple(row))
            print(row)
        seq1 = temp[0][0]
        seq2 = temp[1][0]
        return seq1, seq2

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

def seq_length(seq1,seq2):
    """
    Find which sequence is longer by counting individual characters in each sequence.
    """
    l1 = len(seq1) #this is a number that is counting the number of characters in sequence 1
    l2 = len(seq2)
    if l1 >= l2: #if l1 is longer than l2, make s1 sequence 1
        s1 = seq1
        s2 = seq2
    else: # if l2 is longer make s1 sequence 2
        s1 = seq2
        s2 = seq1
        l1, l2 = l2, l1 # swap the two lengths if l2 is longer
    return s1,s2,l1,l2

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
def calculate_score(s1, s2, l1, l2, startpoint): #defining function
    """
    A function that computes a score by returning the number of matches starting from 
    arbitrary startpoint.
    """
    matched = "" # to hold string displaying alignments, making an empty variable that we will input a value into later
    score = 0 # add values to it later
    for i in range(l2):
        if (i + startpoint) < l1: # to make sure we dont push sequence 2 beyond the length of sequence 1
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    print("." * startpoint + matched)           
    print("." * startpoint + s2)
    print(s1)
    print(score) 
    print(" ")

    return score

# Test the function with some example starting points:
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)

# now try to find the best match (highest score) for the two sequences

def best_match(s1,s2,l1,l2):
    """
    A function to align the sequences and calculate the highest number of matches in 
    bases between the two.
    """
    my_best_align = None
    my_best_score = -1
    for i in range(l1): # Note that you just take the last alignment with the highest score
        z = calculate_score(s1, s2, l1, l2, i)
        if z > my_best_score:
            my_best_align = "." * i + s2 
            my_best_score = z # save best score
    
    print(my_best_align)
    print(s1)
    print("Best score:", my_best_score)
    print("Best score:", my_best_score,"\n","Best align:","\n",my_best_align, "\n", s1, file=open('../results/alignmentoutput.txt',"w"))
    
    return my_best_align, my_best_score


def main(argv):
    """ 
    Main entry point of the programme.
    """
    if len(argv) < 3:
        seq1,seq2 = read_csv()
        s1,s2,l1,l2 = seq_length(seq1,seq2)
        my_best_align, my_best_score = (best_match(s1,s2,l1,l2))

    output = str(['Optimal alignment: ', my_best_align, 'Sequence 1: ', s1, 'Best score: ', my_best_score])
    with open ('../results/MyBestAlignment.txt', 'w') as output_file:
        output_file.writelines(output) # writelines is basically the same as multiple f.write()

    return 0


if __name__ == "__main__": 
    """
    Makes sure the "main" function is called from command line.
    """  
    status = main(sys.argv)
    sys.exit(status)