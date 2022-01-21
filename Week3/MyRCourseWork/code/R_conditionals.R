# This is an R script. This script illustrates examples of functions 
# with conditionals, such as n %% 2 == 0. This conditional only allows 
# execution if n is divisible by two, I.e. if it is an even number. 
# This script saves the functions to the workspace and therefore can 
# be called from the command line with given inputs without sourcing 
# the whole script. This script prints to the console.

# Checks if an integer is even
is.even <- function(n = 2){
  if (n %% 2 == 0) # %% is divisible by ...
  {
    return(paste(n,'is even!')) # paste concatenates strings
  } 
  return(paste(n,'is odd!'))
}

is.even(6)

# Checks if a number is a power of 2
is.power2 <- function(n = 2){
  if (log2(n) %% 1==0)
  {
    return(paste(n, 'is a power of 2!'))
  } 
  return(paste(n,'is not a power of 2!'))
}

is.power2(4)

# Checks if a number is prime
is.prime <- function(n){
  if (n==0){
    return(paste(n,'is a zero!'))
  }
  if (n==1){
    return(paste(n,'is just a unit!'))
  }
  ints <- 2:(n-1) # range from 2 to n-1
  if (all(n%%ints!=0)){
    return(paste(n,'is a prime!'))
  } 
  return(paste(n,'is a composite!'))
}

is.prime(3)