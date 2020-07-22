
# This function creates multiple plots to give a multivariate summary of the household power consumption 
create_Plot4 <- function() {
  source("./loadData.R")
  source("./plot2.R")
  source("./plot3.R")
  
  # using the loadData() Function to get the specific subset of data to be analysed
  data <- loadData()
  
  # set system locale to english to get english weekday names 
  dev_null <- Sys.setlocale("LC_TIME", "english")
  
  # combine Date and Time 
  dateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
  
  # creating a 2 x 2 panel 
  par(mfrow=c(2,2))
  
  #loading the plot2 into the panel
  create_Plot2()
  
  # creating an additional plot for the voltage by dateTime 
  plot(dateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  # loading plot3 into the panel 
  create_Plot3()
  
  # creating an additional plot for the Global reactive power
  plot(dateTime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  # print to png device (create png file)
  dev.print(png, file = "plot4.png", width = 1024, height = 768)
  
}