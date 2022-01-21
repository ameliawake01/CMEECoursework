# This is an R script. This script demonstrates the stochastic Ricker 
# model, similar to the original Ricker model, but with introduced random 
# error. This script behaves in the same way as Ricker.R. This script takes 
# no arguments from the command line and prints to the console. 

# Runs the stochastic Ricker equation with gaussian fluctuations

rm(list = ls())

stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  rand.gen <- rnorm((numyears*p0), 0, sigma)

  for (yr in 2:numyears){
    N[yr, ] <- N[yr-1, ] * exp(r * (1 - N[yr - 1, ] / K) + rand.gen[yr]) # add one fluctuation from normal distribution
  
    }
 return(N)

}

print("Vectorized Stochastic Ricker takes:")
print(system.time(res2<-stochrickvect()))
