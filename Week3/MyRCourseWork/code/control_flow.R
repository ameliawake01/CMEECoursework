# This is an R script. This script exemplifies the use of control-flow 
# tools in fine-tuning a programme, such statements are useful to include 
# in functions and scripts if you only want to perform tasks under a 
# certain condition. This script takes no arguments and prints to the 
# console.

a <- TRUE
if (a == TRUE){ # if a is TRUE
    print ("a is TRUE")
    } else { # if it is false
    print ("a is FALSE")
}

z <- runif(1) # generates random deviates of the uniform distribution
if (z <= 0.5) { # if z is smaller than or equal to
    print ("Less than a half")
}

for (i in 1:10){ # range 1-10
    j <- i * i # i multiplied by i
    print(paste(i, " squared is", j ))
}

for(species in c('Heliodoxa rubinoides',
                 'Boissonneaua jardini',
                 'Sula nebouxii')){ # vector containing species data
    print(paste('The species is', species)) # paste() concatenates strings
}

v1 <- c("a","bc","def")
for (i in v1){ # iterate through all members of the vector
    print(i)
}

i <- 0
while (i < 10){ # while i is less than ten, until a condition is met
    i <- i+1 
    print(i^2)
}