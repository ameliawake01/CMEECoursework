#Setting the working directory to code.
setwd("/home/amelia-wake/Documents/CMEECoursework/Miniproject/code")

#Reading in the data and assigning it to the data variable.
data <- read.csv("../data/LogisticGrowthData.csv")

#Converting Temp to string values.
data$Temp = as.character(data$Temp)

#Adding a new column to the dataframe called "ID", containing unique ID numbers 
#based on the combination of the Species, Medium, Temp and Citation column. 
data$ID <- paste(data$Species, data$Temp, data$Medium, data$Citation, sep = " ")

#Adding a new column to the dataframe called "ID_num",
#replacing the ungainly IDs with numbers by transforming ID column to factor.
data$ID_num <- as.factor(data$ID)
levels(data$ID_num) <- 1:nlevels(data$ID_num)

#Removing any values less than 0 from the Time and PopBio columns in the dataframe. 
data <- data[-c(which(data$Time < 0)), ]
data <- data[-c(which(data$PopBio < 0)), ]

#Saving the wrangled data to a csv file. 
write.csv(data, "../data/WrangledData.csv", row.names = FALSE)
