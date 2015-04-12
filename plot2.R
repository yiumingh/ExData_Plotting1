plot2 = function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  data <- within(data, { timestamp=as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) })
  
  Global_active_power <- gsub(",", "", data$Global_active_power)
  Global_active_power <- as.numeric(Global_active_power)
  
  png("plot2.png", width=480, height=480)  
  plot(data$timestamp, Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}