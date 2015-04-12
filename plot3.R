plot3 = function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  data <- within(data, { timestamp=as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) })
  Sub_metering_1 <- gsub(",","",data$Sub_metering_1)
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  
  Sub_metering_2 <- gsub(",", "", data$Sub_metering_2)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  
  Sub_metering_3 <- gsub(",", "", data$Sub_metering_3)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
  
  png("plot3.png", width=480, height=480)  
  plot(data$timestamp, Sub_metering_1, type='l', ylab="Enegy sub metering", xlab="")
  lines(data$timestamp,Sub_metering_2, col="red", type='l')
  lines(data$timestamp,Sub_metering_3, col="blue", type='l')
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1))
  
  dev.off()
}