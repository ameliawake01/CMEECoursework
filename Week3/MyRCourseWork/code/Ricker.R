# This is an R script. This script illustrates the Ricker model, a classic 
# discrete population model which was introduced in 1954 by Ricker to model 
# recruitment of stock in fisheries. This script takes no arguments from the 
# command line and prints to the console.

Ricker <- function(N0=1, r=1, K=10, generations=50)
{
  # Runs a simulation of the Ricker model
  # Returns a vector of length generations
  
  N <- rep(NA, generations)    # Creates a vector of NA
  
  N[1] <- N0
  for (t in 2:generations)
  {
    N[t] <- N[t-1] * exp(r*(1.0-(N[t-1]/K)))
  }
  return (N)
}

plot(Ricker(generations=10), type="l")