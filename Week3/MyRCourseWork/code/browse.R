# This is an R script. This script illustrates the browser() function, 
# a simple way of debugging in R. The browser function allows you to insert 
# a breakpoint in your script and then step through the code. It is used to 
# examine local variables e.g. inside a for loop. This script takes no 
# command line arguments and prints to the console.

Exponential <- function(N0 = 1, r = 1, generations = 10){
  # Runs a simulation of exponential growth
  # Returns a vector of length generations
  
  N <- rep(NA, generations)    # Creates a vector of NA
  
  N[1] <- N0
  for (t in 2:generations){
    N[t] <- N[t-1] * exp(r)
    browser()
  }
  return (N)
}

plot(Exponential(), type="l", main="Exponential growth")