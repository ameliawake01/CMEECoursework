# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"

TreeData <- read.csv("../data/trees.csv", header = TRUE) # reading in the data

TreeHeight <- function(degrees, distance){ # function to calculate tree height
    radians <- degrees * pi / 180
    height <<- distance * tan(radians)
    print(paste("Tree height is:", height))
  
    return (height)
}

TreeData$Tree.Height.m <- 0 # creating a new column and filling it with zeros
for (i in 1:nrow(TreeData)) { # populating the new column by going through each row and calculating using the function
  n <- TreeHeight(TreeData[i,3], TreeData[i,2])
  TreeData[i,4] <- n
}

write.csv(TreeData, "../results/TreeHts.csv") # saving output to a csv file