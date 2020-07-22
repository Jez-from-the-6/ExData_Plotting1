
# This is a function to create a plot showing the Global Active Power Levels according 
# to the day of the week (Thursday - Saturday)
create_Plot2 <- function() {
  source("./loadData.R")
  
  # using the loadData() Function to get the specific subset of data to be analysed
  data <- loadData()
  
  # set system locale to english to get english weekday names 
  dev_null <- Sys.setlocale("LC_TIME", "english")
  
  # combine Date and Time 
  dateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
  
  # plotting a line graph with dateTime as x and Global_active_power as y values
  plot(dateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
  
  dev.print(png, file = "plot2.png", width = 1024, height = 768)
}