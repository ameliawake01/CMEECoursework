# This is an R script. This script demonstrates the usefulness of breaking 
# out of loops when a condition is met. This script takes no arguments from 
# the command line and prints to the console.

# We use break when we cannot set a target number of iterations and would like
# to stop the loop execution once some condition is met.
i <- 0 #Initialize i
    while(i < Inf) {
        if (i == 10) {
            break 
             } # Break out of the while loop! 
        else { 
            cat("i equals " , i , " \n")
            i <- i + 1 # Update i
    }
}