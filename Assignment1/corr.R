# Part 3

#Write a function that takes a directory of data files and a threshold for complete cases and calculates the 
#correlation between sulfate and nitrate for monitor locations where the number of completely observed cases 
#(on all variables) is greater than the threshold. The function should return a vector of correlations for the 
#monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function
#should return a numeric vector of length 0. A prototype of this function follows

corr <-function(directory, threshold = 0) {
  id = 1:332
  files <-list.files(directory, full.names = TRUE) #Get a character vector of the names of files in a specific directory
  cr <- c() #Create empty vector 
  for(i in id) { 
    data <- read.csv(files[i], header = TRUE)
    data <- data[complete.cases(data),] #Remove missing values 
    complete_cases <- nrow(data) #count number of observations
    if (complete_cases> threshold) {  #Number of completedly oberved cases must be greater than threshold
      cr <- c(cr, cor(data$sulfate,data$nitrate)) # Get correlation between nitrate and sulfate 
                                                  # since it is not a data frame, we cannot use rbind here
    }
  }
  return(cr) #output result
}
