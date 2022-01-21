# This is an R script. This is a simple script to illustrate R input-output. 
# This script takes in a .csv file from the data directory and appends the 
# data contained in this to a new .csv file in the results directory.

MyData <- read.csv("../data/trees.csv", header = TRUE) # import with headers

write.csv(MyData, "../results/MyData.csv") # write it out as a new file

write.table(MyData[1,], file = "../results/MyData.csv",append=TRUE) # append to it

write.csv(MyData, "../results/MyData.csv", row.names=TRUE) # write row names

write.table(MyData, "../results/MyData.csv", col.names=FALSE) # ignore column names

print("Sript complete!")