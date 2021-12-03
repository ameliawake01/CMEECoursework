#Setting the working directory to code.
setwd("/home/amelia-wake/Documents/CMEECoursework/Miniproject/code")

#Load all necessary packages required for model fitting. 
require(minpack.lm)
require(purrr)
require(dplyr)
require(ggplot2)
require(broom)

#Reading in the data and assigning it to the data variable.
data <- read.csv("../data/WrangledData.csv", header = TRUE)

#Subsetting the data by ID number
dat_list = split(data, data$ID_num)

#Fitting a cubic (orthogonal) polynomial regression. 
#Map() allows me to apply a function to each variable in a list (I.e. each specific ID subset).
map(dat_list, ~lm(PopBio ~ poly(Time,3), data= .x))

r2 = function(data) {
  fit = lm(PopBio ~ poly(Time,3), data = data)
  x <- lm(PopBio ~ poly(Time,3), data = data)
  
  broom::glance(fit)
}
r2(data = data)

results_polynomial <- map_dfr(dat_list, r2, .id = "id")

#Fitting a Logistic model.
logistic_model <- function(t, r_max, K, N_0){
  return(N_0 * K * exp(r_max * t)/(K + N_0 * (exp(r_max * t) - 1)))
}

fit_logistic <- function(data){
  
  N_0_start <- min(data$PopBio)
  K_start <- max(data$PopBio)
  r_max_start <- 0.018855
  tryCatch({
    (nlsLM(PopBio ~ logistic_model(t = Time, r_max, K, N_0), data, list(r_max=r_max_start, N_0 = N_0_start, K = K_start))) %>% glance()
  },
  error = function(e) {
    tibble(sigma = c(NA_real_))
  })}

results_logistic <-data %>% group_by(ID_num) %>%group_modify(~fit_logistic(data =.))

#Fitting the Gompertz model. 
gompertz_model <- function(t, r_max, K, N_0, t_lag){ # Modified gompertz growth model (Zwietering 1990)
  return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
} 

fit_gompertz <- function(data){
  
  N_0_start <- min(data$PopBio) # lowest population size, note log scale
  K_start <- max(data$PopBio) # highest population size, note log scale
  r_max_start <- 0.018855 # use our previous estimate from the OLS fitting from above
  t_lag_start <- data$Time[which.max(diff(diff(data$PopBio)))] # find last timepoint of lag phase
  tryCatch({
    (nlsLM(PopBio ~ gompertz_model(t = Time, r_max, K, N_0, t_lag), data,
            list(t_lag=t_lag_start, r_max=r_max_start, N_0 = N_0_start, K = K_start))) %>% glance()
  },
  error = function(e) {
    tibble(sigma = c(NA_real_))
  })}

results_gompertz <- data %>% group_by(ID_num) %>%group_modify(~fit_gompertz(data =.))


for (i in 0:284){
  #Plotting the results of the models.
  data2<-data %>% filter(ID_num == i)
  print(paste0(i, ": ", min(data2$Time), max(data2$Time)))
  timepoints <- seq(min(data2$Time), max(data2$Time))
  
  N_0_start <- min(log(data2$PopBio)) # lowest population size, note log scale
  K_start <- max(log(data2$PopBio)) # highest population size, note log scale
  r_max_start <- 0.018855 # use our previous estimate from the OLS fitting from above
  t_lag_start <- data2$Time[which.max(diff(diff(data2$PopBio)))] # 
  
  tryCatch({
    (fit_logistic2<-nlsLM(PopBio ~ logistic_model(t = Time, r_max, K, N_0), data2,
                       list(r_max=r_max_start, N_0 = N_0_start, K = K_start))) %>% glance()
  },
  error = function(e) {
    tibble(sigma = c(NA_real_))
  })
  
  logistic_points <- log(logistic_model(t = timepoints, 
                                        r_max = coef(fit_logistic2)["r_max"], 
                                        K = coef(fit_logistic2)["K"], 
                                        N_0 = coef(fit_logistic2)["N_0"]))
  
  df1<- data.frame(timepoints, logistic_points)
  df1$model <-"Logistic Model"
  names(df1)<-c("Time", "PopBio", "model")
  
  tryCatch({
    (fit_gompertz2<-nlsLM(log(PopBio) ~ gompertz_model(t = Time, r_max, K, N_0, t_lag), data2,
                       list(r_max=r_max_start, N_0 = N_0_start, K = K_start, t_lag = t_lag_start))) %>% glance()
  },
  error = function(e) {
    tibble(sigma = c(NA_real_))
  })
  
  gompertz_points <- gompertz_model(t = timepoints, 
                                    r_max = coef(fit_gompertz2)["r_max"], 
                                    K = coef(fit_gompertz2)["K"], 
                                    N_0 = coef(fit_gompertz2)["N_0"], 
                                    t_lag = coef(fit_gompertz2)["t_lag"])
  
  
  df2 <- data.frame(timepoints, gompertz_points)
  df2$model <- "Gompertz model"
  names(df2) <- c("Time", "LogPopBio", "model")
  df2$PopBio <- exp(df2$LogPopBio)
  
  data_subset <-data %>% filter(ID_num == i)
  timepoints <- seq(min(data_subset$Time), max(data_subset$Time))
  
  temp_plot <- ggplot(data_subset, aes(x = Time, y = PopBio)) +
  geom_point(size = 1) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 3), size = 1, se = F, aes(colour = "Cubic Polynomial")) +
  geom_line(data= df1, aes(x= Time, y = PopBio, colour = "Logistic Model"), size = 1) +
  geom_line(data=df2, aes(x= Time, y= PopBio, colour = "Gompertz Model"), size =1) +
  labs(x = "Time", y = "Abundance")
ggsave(temp_plot, file=paste0("../results/ModelPlots", i, ".pdf", sep = ""))
}

