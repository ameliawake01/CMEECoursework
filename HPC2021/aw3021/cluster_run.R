# Clearing workspace and turning off graphics to remove any existing plots from the space
rm(list = ls())
graphics.off()

# Loading all of the required functions by sourcing the main R file
source("aw3021_HPC_2021_main.R")

# Reading in the job number from the cluster (UNCOMMENT THIS OUT BEFORE SUBMISSION)
iter <- as.numeric(Sys.getenv("PBS_ARRAY_INDEX"))
  
# 'Reading in the job number' for testing on my machine (REMOVE THIS BEFORE SUBMISSION)
#iter <- 100
  
# Setting random number seed as iter
set.seed(iter)

# Selecting the correct value for community in each parallel simulation
# based on the value of iter
if (iter <= 25){
  size <- 500
} else if (iter %in% c(26:50)){
  size <- 1000
} else if (iter %in% c(51:75)){
  size <- 2500
} else {
  size <- 5000
} 
  
# Defining inputs for cluster_run function
speciation_rate <- 0.0050845
wall_time <- 690
interval_rich <- 1
interval_oct <- round((size)/10)
burn_in_generations <- (8*(size))
output_file_name <- paste("cluster_run_output", iter, ".rda", sep = "")
  
# Running the simulation
cluster_run(speciation_rate, size, wall_time, interval_rich, interval_oct, burn_in_generations, output_file_name)
