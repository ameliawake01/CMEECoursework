# This is an R script. This script demonstrates using the next command to 
# skip to the next iteration of a loop. Similarly, next and break can both 
# be used within other loops. This script takes no arguments from the command 
# line and prints to the console.

for (i in 1:10) { # range 1-10
  if ((i %% 2) == 0) # check if the number is odd
    next # pass to next iteration of loop 
  print(i)
}