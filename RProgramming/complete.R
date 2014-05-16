complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
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
      myData <- read.table(myFile, sep =",", header = TRUE)
      myObs <- myData[!is.na(myData$sulfate) & !is.na(myData$nitrate),]
      print(dim(myObs))
    } else{
      print("Error File !")
      return
    }
  }

  return
}