pollutantmean <- function(directory, pollutant, id=1:332) {
 files <-list.files(directory, full.names = TRUE) #Get a character vector of the names of files in a specific directory
 data1 <- data.frame()  #Create an empty data frame
 for(i in id) { #Do a loop to add rows from specific id into the new data frame (data1)     
   data1 <- rbind(data1, read.csv(files[i]))
 }
 round(mean(data1[,pollutant], na.rm=TRUE),3) #Get mean of pollutant rounded to third decimal while ignoring missing values
 }
