# CMEE 2021 HPC exercises R code main pro forma
# you don't HAVE to use this but it will be very helpful.  If you opt to write everything yourself from scratch please ensure you use EXACTLY the same function and parameter names and beware that you may loose marks if it doesn't work properly because of not using the proforma.

name <- "Amelia Wake"
preferred_name <- "Amelia"
email <- "aw3021@imperial.ac.uk"
username <- "aw3021"

# please remember *not* to clear the workspace here, or anywhere in this file. If you do, it'll wipe out your username information that you entered just above, and when you use this file as a 'toolbox' as intended it'll also wipe away everything you're doing outside of the toolbox.  For example, it would wipe away any automarking code that may be running and that would be annoying!

# Question 1
species_richness <- function(community){
  
  # Counting the number of unique values in the vector community to represent the number of species
  # Unique() eliminates or deletes the duplicate values or the rows present in a vector, dataframe or matrix
  # Length() obtains the length of a vector (including lists) or a factor
  
  return(length(unique(community)))
}

# Question 2
init_community_max <- function(size){

  # Generating init_community_max by creating a regular sequence of numbers, 
  # containing the amount of numbers as given by size, with each number in the sequence being unique  
  # Seq() generates a regular sequence with the starting value being default 1 unless otherwise specified
  
  return(seq(size))
}

# Question 3
init_community_min <- function(size){
  
  # Generating init_community_min by creating a vector, containing the amount of numbers as given by size,
  # with each number being identical to the others
  # Rep_len() is used to replicate a given value for a specified length
  
  return(rep_len(1, size))
}

# Question 4
choose_two <- function(max_value){
  
  # Choosing a random uniform number between 1 and the max_value given as input, inclusive of the endpoints
  # It also chooses a second random uniform number between 1 and the max_value that is not equal to the first number generated (replace=FALSE)
  # Sample() takes a sample of a specified size (2) from the elements given as x (1:max_value)
  
  return(sample(1:max_value, size=2, replace=FALSE))
}

# Question 5
neutral_step <- function(community){
  
  # Performing a single step of a simple neutral model simulation without speciation
  # An individual from community is chosen to die and another individual is chosen to replace it by reproducing and filling the gap (choose_two)
  # Replace() replaces a value given in x (community) with indices given in a list (indexoutput) by those given in values (community[indexoutput[2]])
  
  indexoutput <- choose_two(length(community))
  community <- replace(community, indexoutput[1], community[indexoutput[2]])
  return(community)
}

# Question 6
neutral_generation <- function(community){
  
  # Simulating several neutral_steps on a community so that a generation has passed
  # If the community consists of x individuals, then x/2 individual neutral_steps will correspond to a complete generation for the taxa being simulated 
  # (if ((length(community) %%2) == 0)) If the length of community divided by two equals 0 this corresponds to an even number, else its an odd number
  # If x is odd, choose at random whether to round up or down to the nearest whole number to determine generation length
  # Round() rounds the value given in its first argument to the specified number of decimal places (default 0)
    
    if ((length(community) %% 2) == 0){
      genlength <- (length(community)/2)
    } else {
      genlength <- round((length(community)/2) + sample(c(-1, 1), 1) * .01)
    }

    for (i in 1:(genlength)){
    community <- neutral_step(community)
    }

  return(community)
}

# Question 7
neutral_time_series <- function(community,duration)  {
  
  # Simulating a neutral theory simulation and returning a time series of species richness in the system, 
  # i.e. returning a vector giving the species richness at each generation starting with the initial species richness
  # A vector is initialised outside of the for loop in order to append the result of each loop without overwriting each time
  # When the vector is first initialised it is given the initial species richness as its first value
  
  richness <- c(species_richness(community))
  for (i in 1:duration){
      community <- neutral_generation(community)
      richness <- c(richness, species_richness(community))
  }
  return(richness)
}

# Question 8
question_8 <- function() {
  
  # Plotting a time series graph of a neutral model simulation from an initial condition of maximal diversity in a system size of
  # 100 individuals for 200 generations
  # Returning the answer to "What state will the system always converge to if you wait long enough? Why is this?"
  # Graphics.off() clears the plotting space 
  
  graphics.off()
  neutral_plot <- neutral_time_series(community = init_community_max(100), duration = 200)
  plot(neutral_plot, type = "l", col = "red", xlab = "Generations", ylab = "Species Richness")
  return("If left long enough, the system will eventually return to minimum species richness i.e. species richness = 1. This is due to the fact that there is no speciation and when an individual dies, there is only the option of a species that already exists in the community reproducing and taking its place.")
}

# Question 9
neutral_step_speciation <- function(community,speciation_rate)  {
  
  # Performing a step of a neutral model with simulation
  # In each time step, speciation will replace a dead individual with a new species (with probability speciation_rate) otherwise the dead individual
  # is replaced with the offspring of another individual 
  # Runif() generates random deviates of the uniform distribution with runif(n) number of samples
  # (Max(community) +1) ensures that the new individual is given an identity not already present in the community by adding 1 to the largest number in the vector

  if (runif(1) < speciation_rate){
    indexoutput <- choose_two(length(community))
    newnumber <- (max(community) +1)
    community <- replace(community, indexoutput[1], newnumber)
    return(community)
  } else {
    indexoutput <- choose_two(length(community))
    community <- replace(community, indexoutput[1], community[indexoutput[2]])
  }
  return(community)
}

# Question 10
neutral_generation_speciation <- function(community,speciation_rate)  {
  
  # Performing a neutral model simulation with speciation, advancing one generation according to the rules of the model
  # Returning the state of the community at the end of the generation long set of simulation steps
  # If the community consists of x individuals, then x/2 individual neutral_steps will correspond to a complete generation for the taxa being simulated 
  # (if ((length(community) %%2) == 0)) If the length of community divided by two equals 0 this corresponds to an even number, else its an odd number
  # If x is odd, choose at random whether to round up or down to the nearest whole number to determine generation length
  # Round() rounds the value given in its first argument to the specified number of decimal places (default 0)
  
  if ((length(community) %% 2) == 0){
    genlength <- (length(community)/2)
  } else {
    genlength <- round((length(community)/2) + sample(c(-1, 1), 1) * .01)
  }
  
  for (i in 1:(genlength)){
    community <- neutral_step_speciation(community, speciation_rate)
  }
  return(community)
}

# Question 11
neutral_time_series_speciation <- function(community,speciation_rate,duration)  {
  
  # Performing a neutral simulation with speciation, returning a time series vector giving the species richness 
  # at each generation starting with the initial species richness
  # A vector is initialised outside of the for loop in order to append the result of each loop without overwriting each time
  # When the vector is first initialised it is given the initial species richness as its first value
  
  newcommunity <- community
  richness <- c(species_richness(community))
  
  for (i in 1:duration){
    newcommunity <- neutral_generation_speciation(newcommunity,speciation_rate)
    richness <- c(richness, species_richness(newcommunity))
  }
  return(richness)
}

# Question 12
question_12 <- function()  {
  
  # Performing a neutral theory simulation with speciation and plotting species richness against time
  # Graphics.off() clears the plotting space
  # A neutral theory simulation with speciation is performed on both initial community states - init_community_max and init_community_min
  # for 200 generations and the time series vector of species richness is stored in variables neutral_plot2 and neutral_plot3
  # Neutral_plot2 is plotted on a graph with (type = "l") joining the points with a line
  # Lines() takes coordinates given in various forms and joins the corresponding points with a line segment, neutral_plot3 is appended to the graph in this way
  # Grid() add an nx by ny rectangular grid to an existing plot
  # Legend() add a legend to a plot with the first argument determining the placement of the legend on the graph and (lty = 1) determine line type
  # Answers the following question: "Explain what you found from this plot about the effect of initial conditions. Why does the
  # neutral model simulation, give you those particular results?"
  
  graphics.off()
  neutral_plot2 <- neutral_time_series_speciation(community = init_community_max(100), speciation_rate = 0.1, duration = 200)
  neutral_plot3 <- neutral_time_series_speciation(community = init_community_min(100), speciation_rate = 0.1, duration = 200)
  plot(neutral_plot2, 
       type = "l", 
       xlab = "Time (Generations)", 
       ylab = "Species Richness (No. of Species)",
       main = "The Effect of the Initial State of the Community \n on Species Richness over Time (Generations)",
       col = "red")
  lines(neutral_plot3, 
        col = "green")
  grid(12, NA, lwd = 2, lty = 1)
  legend("topright", 
         title = "Initial State of the Community",
         legend = c("Maximum Species Richness", "Minimum Species Richness"), 
         col = c("red", "green"), 
         lty = 1)
  
  return("It is suggested from this plot that the initial condition of the community does not matter greatly after the 'burn-in' period as it converges towards dynamic equilibrium. This seems to be the case because there is equal death and speciation/reproduction. Both initial conditions (init_community_max and inot_community_min) had the same speciation rate applied to them and therefore they converged around the same level of species richness after a certain amount of generations.")
}

# Question 13
species_abundance <- function(community)  {
  
  # Calculating the abundances of the species in the system given by the inputted community vector in decreasing order
  # The function will return a count of each number in the community vector, starting with the highest count
  # Table() builds a contingency table of the counts at each combination of factor levels.
  # Sort() arranges a vector or factor into ascending or descending (decreasing = TRUE) order
  # Dimnames() retrieves or sets the dimension names of an object (NULL removes the dimension names)
  
  species_abundance <- table(community)
  dimnames(species_abundance) <- NULL
  return(sort(species_abundance, decreasing = TRUE))
}

# Question 14
octaves <- function(abundance_vector) {
  
  # Binning the abundances of species (the output of the species abundance function) into 'octave classes'
  # Returns a vector where the nth value tells you how many species have an abundance of greater than or equal to 2^n-1
  # Log2() is logging each number in the vector by 2 in order to determine what bin to put the value in to
  # Floor() is rounding any decimals down to next whole integer as we don't have bins for decimal values
  # Tabulate() takes the integer-valued vector 'bin' and counts the number of times each integer occurs in it
  
  return(tabulate(floor(log2(abundance_vector)) +1))
}

# Question 15
sum_vect <- function(x, y) {
  
  # Takes two vectors as inputs and returns the sum of each position in both vectors after filling whichever of the vectors that is shorter with zeros 
  # to bring it to the correct length
  # This is due to the system being stochastic therefore independent readings need to be averaged to get an idea of the overall
  # behaviour of the system
  # The if statement states: if the length of x is not equal to the length of y, determine which vector is smaller and repeat 0 
  # for the length that is missing
  # Then, when both vectors are of the same length, bind them together into a matrix with each vector on an independent row
  # and sum the columns to total each individual number in both vectors
  # If both vectors are the same length to begin with, just bind them and sum for the total
  
  vectors <- list(x,y)
  
  if (length(x) != length(y)) {
    shorterindex <- which.min(c(length(x),length(y)))
    longerindex <- which.max(c(length(x), length(y)))
    vectors[[shorterindex]] <- c((vectors[[shorterindex]]), rep(0, (length(vectors[[longerindex]])-length(vectors[[shorterindex]]))))
    return(colSums(rbind(vectors[[shorterindex]],vectors[[longerindex]])))
  } else {
    return(colSums(rbind(x,y)))
  }
}

# Question 16 
question_16 <- function()  {
  
  # Clearing existing graphs from the space
  graphics.off()
  
  max_community <- init_community_max(100)
  min_community <- init_community_min(100)
  initial_max_octave <- c()
  initial_min_octave <- c()
  
  # Running a neutral model simulation with speciation on community max and min for a 'burn in' period of 200 generations
  # Recording the species abundance octave vector
  for (i in 1:2200){
    max_community <- neutral_generation_speciation(community = max_community, speciation_rate = 0.1)
    min_community <- neutral_generation_speciation(community = min_community, speciation_rate = 0.1)
    
    # Continuing the simulation for 2000 generations using burn_in and burn_in2 as the new communities in order to 
    # continue from where we left off
    # Recording the species abundance octave vector every 20 generations
    if ((i %% 20 == 0) & (i > 200)){
      max_octaves <- octaves(species_abundance(max_community))
      min_octaves <- octaves(species_abundance(min_community))
      initial_max_octave <- sum_vect(max_octaves, initial_max_octave)
      initial_min_octave <- sum_vect(min_octaves, initial_min_octave)
    }
  }

  # Calculating the means for each octave class of the communities
  mean_max_octave <- (initial_max_octave/100)
  mean_min_octave <- (initial_min_octave/100)

  # Combine vectors containing mean values for community max and community min into a matrix
  # in order to prepare them for plotting
  combinedmean <- rbind(mean_max_octave, mean_min_octave)
  rownames(combinedmean) <- c("init_community_max", "init_community_min")
  colnames(combinedmean) <- c("1 \u2264 x < 2", "2 \u2264 x < 4", "4 \u2264 x < 8", "8 \u2264 x < 16", "16 \u2264 x < 32", "32 \u2264 x < 64")
  
  # Plot bar chart of the mean species abundance distribution (as octaves)
  xcoord <- barplot(combinedmean, beside = TRUE, 
                  col = c("red", "green"),
                  ylim = c(0,15),
                  xlab = "Octave Class",
                  ylab = "Mean (Frequency) Species Abundance",
                  main = "Mean Species Abundance Distribution (Octaves)",
                  las = 1,
                  cex.names = 0.70)
  legend("topright", legend = c("Maximum Species Richness", "Minimum Species Richness"), col = c("red", "green"), lty = 1, title = "Inital Condition of the System")
  ycoord <- as.matrix(round(combinedmean[, 1:6]))
  text(xcoord, ycoord +1, labels = as.factor(ycoord))

  # Answering the question: "Does the initial condition of the system matter? Why is this?"
  return("No, both initial state eventually converge to the same average for each octave class, suggesting that it does not matter what the intial condition of the system was. Both conditions end up with the most frequent mean abundance being in the octave class 1<=x<2.")
}


# Question 17
cluster_run <- function(speciation_rate, size, wall_time, interval_rich, interval_oct, burn_in_generations, output_file_name)  {
  
  # Beginning a timer
  tm <- proc.time()[3]
  
  # Starting with a community given by the input (size) with minimal diversity
  community <- init_community_min(size)
  
  # Initialising empty vectors to store results of while loop
  richness <- c()
  iterator = 0
  abund_list <- c()
  
  # Applying neutral generations with a speciation for a predefined amount of time
  # This statement states: while the time elapsed is less than the determined wall time, apply neutral_generation_speciation
  # and save the output as community
  # There is also an iterator introduced in order to keep track of how many iterations occur
  while(((proc.time()[3])- tm) < (wall_time*60)){
    iterator = iterator +1

      community <- neutral_generation_speciation(community,speciation_rate)
      
      # The first if statement within the while loop states: store the species richness at intervals of interval_rich
      # but only during the burn-in period, after this stop recording species richness
      if ((iterator %% (interval_rich) == 0) && (iterator <= 200)){
        richness <- c(richness, species_richness(community))
      }

      # The second if statement states: for the entire simulation until the simulation runs out of time, record species
      # abundances as octaves every interval_oct generations
      if (iterator %% (interval_oct) == 0){
        abund_list <- c(abund_list, list(octaves(species_abundance(community))))
      }
    }
  
  tm <- proc.time()[3] - tm
  save(richness, abund_list, community, tm, speciation_rate, size, wall_time, interval_rich, interval_oct, burn_in_generations, file = output_file_name)
}

# Questions 18 and 19 involve writing code elsewhere to run your simulations on the cluster

# Question 20 
process_cluster_results <- function()  {
  
  # Initialising an empty vector to store the summed vectors before calculating the mean
  # Initialising a count feature to know how many times to divide the summed vectors to produce the mean
  total <- c(0,0)
  count <- 0

  # Each for loop is a subset for communities 500,100,2500 and 5000
  for (i in 1:25){
    load(paste0("cluster_run_output", i, ".rda"))
    for (i in 80:length(abund_list)){
      total <- sum_vect(total, abund_list[[i]])
    }
    count <- (count + (length(abund_list)-79))
    comm_500_mean <- (total/count)
  } 
  
  for (i in 26:50){
    load(paste0("cluster_run_output", i, ".rda"))
    for (i in 80:length(abund_list)){
      total <- sum_vect(total, abund_list[[i]])
    }
    count <- (count + (length(abund_list)-79))
    comm_1000_mean <- (total/count) 
  }
  
  for (i in 51:76){
    load(paste0("cluster_run_output", i, ".rda"))
    for (i in 80:length(abund_list)){
      total <- sum_vect(total, abund_list[[i]])
    }
    count <- (count + (length(abund_list)-79))
    comm_2500_mean <- (total/count) 
  }
  
  for (i in 76:100){
    load(paste0("cluster_run_output", i, ".rda"))
    for (i in 80:length(abund_list)){
      total <- sum_vect(total, abund_list[[i]])
    }
    count <- (count + (length(abund_list)-79))
    comm_5000_mean <- (total/count) 
  }  
  
  # Combine vectors containing mean values into a list in order to prepare them for plotting
  combined_results <- list(c(comm_500_mean), c(comm_1000_mean), c(comm_2500_mean), c(comm_5000_mean)) #create your list output here to return

  # saving results to a .rda file
  save(combined_results, file = "combined_results.rda")
  return(combined_results)
}  


plot_cluster_results <- function()  {
    
  # clear any existing graphs and plot your graph within the R window
  graphics.off()
  
  # load combined_results from your rda file
  load("combined_results.rda")
  
  # plot the graphs
  par(mfrow=c(2,2))
  par(mfg=c(1,1))
  barplot((combined_results[[1]]),
          col = "red",
          ylim = c(0,3),
          xlab = "Octave Class",
          ylab = "Mean (Frequency)",
          main = "Community = 500",
          cex.names = 0.5)
  par(mfg=c(1,2))
  barplot((combined_results[[2]]),
          col = "orange",
          ylim = c(0,3),
          xlab = "Octave Class",
          ylab = "Mean (Frequency)",
          main = "Community = 1000",
          cex.names = 0.5)
  par(mfg=c(2,1))
  barplot((combined_results[[3]]),
          col = "yellow",
          ylim = c(0,4),
          xlab = "Octave Class",
          ylab = "Mean (Frequency)",
          main = "Community = 2500",
          cex.names = 0.5)
  par(mfg=c(2,2))
  barplot((combined_results[[4]]),
          col = "pink",
          ylim = c(0,4),
          xlab = "Octave Class",
          ylab = "Mean (Frequency)",
          main = "Community = 5000",
          cex.names = 0.5)
  

  return(combined_results)
}

# Question 21
question_21 <- function()  {
    
  return("1.893, (dimension = x, width = 3, size = 8=3^x), log(8)=log(3^x), log(8)=x.log(3), x=(log(8)/log(3)")
}

# Question 22
question_22 <- function()  {
    
  return("2.727, (dimension = x, width = 3, size = 20=3^x), log(20)=log(3^x), log(20)=x.log(3), x=(log(20)/log(3)")
}

# Question 23
chaos_game <- function()  {
  
  # Clearing any existing graphs from the space
  graphics.off()
  
  # Initialising an empty plot
  plot(0:10, 0:10, type = "n")
  
  # Storing the following three points that correspond to coordinates on a graph
  coordinates <- list(
    A <- c(0,0),
    B <- c(3,4),
    C <- c(4,1)
  )
  
  # Initialising an empty dataframe to store coordinates for plotting later
  coord_dataframe <- data.frame()
  
  # Initialising a point vector X to indicate point (0,0)
  X <- c(0,0)
  coord_dataframe <- rbind(coord_dataframe, X)
  
  # Choosing one of the three points (A,B or C) at random and moving X halfway towards it
  chosen_coordinate <- coordinates[[sample(1:length(coordinates), 1)]]
  coord_dataframe <- rbind(coord_dataframe, (chosen_coordinate/2))

  # Writing a for loop to repeat step c and d 100 times
  for (i in 1:10000){
    
    # Replacing the new coordinates and adding together to simulate a new 'starting point'
    new_coordinate <- coordinates[[sample(1:length(coordinates), 1)]]
    chosen_coordinate <- (chosen_coordinate/2) + (new_coordinate/2)
    coord_dataframe <- rbind(coord_dataframe, chosen_coordinate)
  }
  
  # Plotting dataframe of coordinates 
  plot(coord_dataframe, pch = 16, cex = 0.5, xlab = "x", ylab = "y")
  

  return("type your written answer here")
}

# Question 24
turtle <- function(start_position, direction, length)  {
  
  # Unpacking the start_position into x and y coordinates
  x1 <- start_position[1]
  y1 <- start_position[2]
  
  # Calculating the end_position using trigonometry
  x2 <- x1+length*cos(direction)
  y2 <- y1+length*sin(direction)
  
  # Adding a line to an already existing plot between the start_position and end_position
  lines(c(x1,x2), c(y1,y2))
  
  end_position <- c(x2,y2)
  
  return(end_position) # you should return your endpoint here.
}

# Question 25
elbow <- function(start_position, direction, length)  {
  
  # Running turtle to generate the first line and saving the end_position
  end_position <- turtle(start_position, direction, length)
  
  # Predefining inputs for the second call of turtle, using the end_position of the last line as the new start_position
  start_position <- end_position
  direction <- direction - (pi/4)
  length <- 0.95*length
  
  # Running turtle to generate the second line
  turtle(start_position, direction, length)
}

# Question 26
spiral <- function(start_position, direction, length)  {
  
  # Creating an if condition in order to stop the recursive function
  if (length > 0.1){
    
    # Running turtle to generate the first line and saving the end_position as the new start_position
    start_position <- turtle(start_position, direction, length)
  
    # Running spiral to generate additional lines
    spiral(start_position, (direction - (pi/4)), (0.95*length))
  } 

  return("There is no stop condition for the recursive function.")
}

# Question 27
draw_spiral <- function()  {
  
    # Clearing any existing graphs
    graphics.off()
  
    # Initialising a new empty plot
    plot(-10:10,-10:10, type = "n")
  
    # Drawing a spiral and saving the output to a variable in order to return it again at the end of this function
    output <- spiral(c(-5,5),0.5,5)
    
    return(output)
}

# Question 28
tree <- function(start_position, direction, length)  {
 
  # Creating an if condition in order to stop the recursive function
  if (length > 0.1){
      
    # Running turtle to generate the first line and saving the end_position as the new start_position
    start_position <- turtle(start_position, direction, length)
    
    # Running tree twice from the same start_position going opposite directions due to the +/- sign
    tree(start_position, (direction-(pi/4)), (0.65*length))
    tree(start_position, (direction+(pi/4)), (0.65*length))
  }
} 


draw_tree <- function()  {
  
  # clearing any existing graphs from the space
  graphics.off()
  
  # Initialising an empty plot
  plot(-10:30,-10:30, type = "n")
  
  tree(c(0,0),0.5,10)

}

# Question 29
fern <- function(start_position, direction, length)  {
  
  # Creating an if condition in order to stop the recursive function
  if (length > 0.025){
    
    # Running turtle to generate the first line and saving the end_position as the new start_position
    start_position <- turtle(start_position, direction, length)
    
    # Running fern twice from the same start_position going left (+) and straight
    fern(start_position, (direction), (0.87*length))
    fern(start_position, (direction+(pi/4)), (0.38*length))
  }
}

draw_fern <- function()  {
  
  # clear any existing graphs and plot your graph within the R window
  graphics.off()

  # Initialising an empty plot
  plot(-15:15,0:30, type = "n")
  
  fern(c(0,0),1.5708,4)
}

# Question 30
fern2 <- function(start_position, direction, length, dir)  {
  
  # Running turtle to generate the first line and saving the end_position as the new start_position
  start_position <- turtle(start_position, direction, length)
  
  # Multiplying a negative number by dir to produce either a negative number
  # i.e. to decide whether to plot on the left or the right
  dir <- dir*-1
  
  # Creating an if condition in order to stop the recursive function
  if (length > 0.1){
    
    # Multiplying direction by dir
    direction <- direction*dir
    
    # Producing the second half of the fern
    fern2(start_position, direction, length, dir)
  }
}
draw_fern2 <- function()  {
  # clear any existing graphs and plot your graph within the R window
  graphics.off()

  # Initialising an empty plot
  plot(-15:15,0:30, type = "n")
  
  fern2(c(0,0),1.5708,4,1)
}

# Challenge questions - these are optional, substantially harder, and a maximum of 16% is available for doing them.  

# Challenge question A
Challenge_A <- function() {

  # Clearing existing graphs from the space
  graphics.off()
  
  
}

# Challenge question B
Challenge_B <- function() {
  # clear any existing graphs and plot your graph within the R window

}

# Challenge question C
Challenge_C <- function() {
  # clear any existing graphs and plot your graph within the R window

}

# Challenge question D
Challenge_D <- function() {
  # clear any existing graphs and plot your graph within the R window
  
  return("type your written answer here")
}

# Challenge question E
Challenge_E <- function() {
  # clear any existing graphs and plot your graph within the R window
  
  return("type your written answer here")
}

# Challenge question F
Challenge_F <- function() {
  # clear any existing graphs and plot your graph within the R window
  
  return("type your written answer here")
}

# Challenge question G should be written in a separate file that has no dependencies on any functions here.


