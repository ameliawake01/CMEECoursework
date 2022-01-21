# This is an R script. This script calculates the correlation coefficient 
# between temperature and time in Key West, Florida. This is done using a 
# permutation analysis, in order to answer the question: is Florida getting 
# warmer? This script takes no arguments from the command line but extracts
# data from a .csv file in the data directory within the script.

rm(list=ls())
load("../data/KeyWestAnnualMeanTemperature.RData")
ls()
class(ats)
head(ats)
View(ats)
names(ats)
plot(ats)

# calculating correlation coefficient for original data
ogdata <- cor(y=ats$Temp, x=ats$Year, method = "pearson")
# for reproducability of results
set.seed(1)
# the number of observations to sample
n <- length(ats$Year)
# the number of permutation samples to take
P <- 100
# the variable we will resamples from 
variable <- ats$Temp
# initialise a matrix to store the permutation data
PermSamples <- matrix(0, nrow = n, ncol = P) # each column is a permutation sample of data
for (i in 1:P) {
  PermSamples[,i] <- sample(variable, size=n, replace=FALSE)
}
PermSamples[, 1:5]
#initialise vectors to store all of the Test stats:
Perm.test.stat1 <- rep(0, P)
#calculate the test-stats
for (i in 1:P){
  Perm.test.stat1[i] <- cor(PermSamples[,i], ats$Year, method = "pearson")
}
# calculate the permutation p-value and store
mean(Perm.test.stat1 >= ogdata)
no_times_larger <- sum(Perm.test.stat1 >= ogdata)
p_vaue <- no_times_larger/P

# interpret and present the results

