# The purpose of this Function is to create a PNG image of
# a Histogram, which depicts the frequencies of 
# 'Global Active Power' Levels in Kilowatts between 
# 01/02/2007 and 02/02/2007
create_Plot1 <- function() {
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
  
  # reading in the data as a table from the data source
  data <- read.table("./household_power_consumption.txt", header = FALSE, skip = diff1, nrows = diff2 - diff1, sep = ";")
  
  # separating out the global power values and saving them in a variable
  # also typecasting the values to numerics
  glob_actv_pw <- as.numeric(data[[3]]) 
  
  #cleaning out the NA Values 
  glob_actv_pw <- glob_actv_pw[!is.na(glob_actv_pw)]
  
  # Creating a Histogramm without the x/y Axis
  hist(
    glob_actv_pw, 
    breaks = 15, 
    col = "red", 
    xlab = "Global Active Power (kilowatts)",
    main = " Global Active Power"
  )
  
  dev.print(png, file = "plot1.png", width = 1024, height = 768)
}

