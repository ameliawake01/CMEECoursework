# This is an R script. This script demonstrates the efficiency of 
# pre-allocation. Memory allocation for a particular variable is 
# particularly slow in R when you are using loops, due to the loops 
# repeatedly resizing a vector and re-allocating memory. Pre-allocatign 
# a vector that fits all the values, doesnt require a re-allocation of 
# memory each iteration. This script takes no arguments from the command 
# line and prints to the console.

NoPreallocFun <- function(x){
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        invisible(a)
        invisible(object.size(a))
    }
}

system.time(NoPreallocFun(1000))

PreallocFun <- function(x){
    a <- rep(NA, x) # pre-allocated vector
    for (i in 1:x) {
        a[i] <- i # assign
        invisible(a)
        invisible(object.size(a))
    }
}

system.time(PreallocFun(1000))