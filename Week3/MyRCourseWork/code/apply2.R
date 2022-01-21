# This is an R script. This script behaves similarly to apply1.R, 
# however instead of using the *apply family of functions on some of R's 
# inbuilt functions, here it is being demonstrated on our own defined 
# functions. This script takes no arguments from the command line and 
# prints to the console.

SomeOperation <- function(v){ # if the sum of v is greater than 0, multiply v by 100
  if (sum(v) > 0){ #note that sum(v) is a single (scalar) value
    return (v * 100)
  }
  return (v)
}

# if v has positive and negative numbers, and the sum comes out to be positive
# only then does it multiply all the values in v by 100 and return them.
M <- matrix(rnorm(100), 10, 10)
print (apply(M, 1, SomeOperation))