# This is an R script. This script demonstrates how to use the *apply 
# family of functions for vectorisation. Apply can be used when you want 
# to apply a function to the rows or columns of a matrix. This script 
# takes no arguments from the command line and prints to the console.

## Build a random matrix
M <- matrix(rnorm(100), 10, 10)

## Take the mean of each row
RowMeans <- apply(M, 1, mean)
print (RowMeans)

## Now the variance
RowVars <- apply(M, 1, var)
print (RowVars)

## By column
ColMeans <- apply(M, 2, mean)
print (ColMeans)