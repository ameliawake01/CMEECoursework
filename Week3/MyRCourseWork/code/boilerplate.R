# This is an R script. This script defines a function that states the 
# class of the given inputs into the function. This function is saved to 
# the workspace and therefore can be called from the command line with 
# given inputs without sourcing the whole boilerplate script. This script 
# prints to the console.

MyFunction <- function(Arg1, Arg2){ # curly brackets are necessary for R to 
  # know where the specification of the function starts and ends.
  
  # Statements involving Arg1, Arg2:
  print(paste("Argument", as.character(Arg1), "is a", class(Arg1))) # print Arg1's type
  print(paste("Argument", as.character(Arg2), "is a", class(Arg2))) # print Arg2's type
    
  return (c(Arg1, Arg2)) #this is optional, but very useful
} # MyFunction is saved as an object into the workspace.

MyFunction(1,2) #test the function
MyFunction("Riki","Tiki") #A different test