# Part 2

#Write a function that reads a directory full of files and reports the number of completely observed 
#cases in each data file. The function should return a data frame where the first column is the name 
#of the file and the second column is the number of complete cases.

complete <- function(directory, id =1:332) {
  files <- list.files(directory, full.names = TRUE) #Get a character vector of the names of files in a specific directory
  data1 <- data.frame() #Create empty data frame
  for(i in id) { #Do a loop to add rows from specific id into the new data frame (data1) 
  nobs <- sum(complete.cases(read.csv(files[i]))) #Set nobs to amount of complete cases
  data2 <- data.frame(id=i, nobs) #Create data frame containing id and nobs
  data1 <- rbind(data1, data2) #Add rows from the data frame containing id and nobs to the original empty data frame
  }
  return(data1) #Output result
}
