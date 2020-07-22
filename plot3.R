
# This function Displays the Energy Sub Metering throughout the weekdays
create_Plot3 <- function() {
  source("./loadData.R")
  
  # using the loadData() Function to get the specific subset of data to be analysed
  data <- loadData()
  
  # set system locale to english to get english weekday names 
  dev_null <- Sys.setlocale("LC_TIME", "english")
  
  # combine Date and Time 
  dateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
  
  # creating the base plot with the values for Sub-Metering_1
  plot(dateTime, data$Sub_metering_1, type="l", ylab="Energy Sub Metering")
  
  # adding the lines for Sub_metering_2 to the plot
  lines(dateTime, data$Sub_metering_2, col="red")
  
  # adding the lines for Sub-metering_3 to the plot 
  lines(dateTime, data$Sub_metering_3, col="blue")
  
  # adding the legend to the plot 
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=1, cex=0.8)
  
  # print to png device (create png file)
  dev.print(png, file = "plot3.png", width = 1024, height = 768)
}