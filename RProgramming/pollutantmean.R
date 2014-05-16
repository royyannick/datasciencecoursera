pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  myData <- NA
  for(i in id){
    #Get File Name.
    if(i < 10){
      myDirectory <- paste(directory, "/00", sep="")
    }else if(i < 100){
      myDirectory <- paste(directory, "/0", sep="")
    }else{
      myDirectory <- paste(directory, "/", sep="")
    }
      
    myFile <- paste(myDirectory, as.character(i), ".csv", sep="")
    
    print(paste("Path : ", myFile))
    
    #Test if File Exists
    if (file.exists(myFile)){
      #Read File.
      myNewData <- read.table(myFile, sep =",", header = TRUE)
      myData <- rbind(myData, myNewData)
      print(dim(myData))
    } else{
      print("Error File !")
      return
    }
  }
  
  if(pollutant == "sulfate" || pollutant == "nitrate"){
    return(mean(myData[pollutant][!is.na(myData[pollutant])]))
  } else{
    print("Error Pollutant !")
    return
  }

}