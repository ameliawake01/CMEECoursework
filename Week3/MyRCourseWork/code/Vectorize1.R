# This is an R script. This script demonstrates the computational 
# efficiency of vectorisation, making code more concise, easy to read 
# and less error prone. This script takes no arguments from the command 
# line and prints to the console.

# R is slow at cycling through a data structure such as a dataframe or 
# matrix, e.g. by using a for loop, because it is high level, interpreted
# computer language. 
# Vectorisation is an approach where you directly apply compiled, 
# optimised code to run an operation on a vector, matrix or an array,
# instead of performing the operation element-wise on the data structure.
M <- matrix(runif(1000000),1000,1000)

SumAllElements <- function(M){
  Dimensions <- dim(M)
  Tot <- 0
  for (i in 1:Dimensions[1]){
    for (j in 1:Dimensions[2]){
      Tot <- Tot + M[i,j]
    }
  }
  return (Tot)
}
 
print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M)))
