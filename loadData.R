#A Helper function to load the specific data subset from the source
loadData <- function() {
  library(reader)
  
  # reading in the start of the recording and splitting the string into variables
  start <-  strsplit(n.readLines("./household_power_consumption.txt", n = 1,  skip = 1), ";" )[[1]]
  
  # date as numeric 
  start_of_recording <- as.numeric( as.Date(start[1], "%d/%m/%Y") )
  
  # Number of minutes of the Timestamp 
  timestamp <- strsplit(start[2], ":")[[1]]
  
  timestamp_in_mins <- ( as.numeric(timestamp[1]) * 60 ) + as.numeric(timestamp[2])
  
  # as formatted date strings: start of data we want, end of data we want  
  strDates <- c("01/02/2007", "03/02/2007")
  
  # make numerics from dates from formatted strings 
  dates <- as.numeric(as.Date(strDates, "%d/%m/%Y") )
  
  # calculate mins between start of dates we want and start of recording
  diff1 <- ((dates[1] - start_of_recording) * 24 * 60 ) - timestamp_in_mins
  
  # calculate mins between end of dates we want and start of recording
  diff2 <- ((dates[2] - start_of_recording) * 24 * 60 ) - timestamp_in_mins
  
  # getting the headers as an array to use them as a param for the data subset
  headers <- read.table("./household_power_consumption.txt", header = FALSE, nrows = 1, sep = ";" )
  
  # reading in the data as a table from the data source
  data <- read.table("./household_power_consumption.txt", header = TRUE, skip = diff1, nrows = diff2 - diff1, sep = ";", col.names = headers )

  data
}