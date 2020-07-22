# The purpose of this Function is to create a PNG image of
# a Histogram, which depicts the frequencies of 
# 'Global Active Power' Levels in Kilowatts between 
# 01/02/2007 and 02/02/2007
create_Plot1 <- function() {
  source("./loadData.R")
  
  # using the loadData() Function to get the specific subset of data to be analysed
  data <- loadData()
  
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

