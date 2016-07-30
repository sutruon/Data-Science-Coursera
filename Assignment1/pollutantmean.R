# Part 1

#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate)
#across a specified list of monitors. The function 'pollutantmean' takes three arguments: 
#'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that 
#'monitors' particulate matter data from the directory specified in the 'directory' argument and returns 
#'the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id=1:332) {
 files <-list.files(directory, full.names = TRUE) #Get a character vector of the names of files in a specific directory
 data1 <- data.frame()  #Create an empty data frame
 for(i in id) { #Do a loop to add rows from specific id into the new data frame (data1)     
   data1 <- rbind(data1, read.csv(files[i]))
 }
 round(mean(data1[,pollutant], na.rm=TRUE),3) #Get mean of pollutant rounded to third decimal while ignoring missing values
 }
