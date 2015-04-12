plot4 = function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  data <- within(data, { timestamp=as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")) })
  
  Global_active_power <- gsub(",", "", data$Global_active_power)
  Global_active_power <- as.numeric(Global_active_power)
  
  Global_reactive_power <- gsub(",", "", data$Global_reactive_power)
  Global_reactive_power <- as.numeric(Global_reactive_power)
  
  
  Voltage <- gsub(",", "", data$Voltage)
  Voltage <- as.numeric(Voltage)
  
  Sub_metering_1 <- gsub(",","",data$Sub_metering_1)
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  
  Sub_metering_2 <- gsub(",", "", data$Sub_metering_2)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  
  Sub_metering_3 <- gsub(",", "", data$Sub_metering_3)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
  
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  plot(data$timestamp, Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")  
  plot(data$timestamp, Voltage, type='l', ylab="Voltage", xlab="datetime")
  plot(data$timestamp, Sub_metering_1, type='l', ylab="Enegy sub metering", xlab="")
  lines(data$timestamp,Sub_metering_2, col="red", type='l')
  lines(data$timestamp,Sub_metering_3, col="blue", type='l')
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), bty="n")
  plot(data$timestamp, Global_reactive_power, type='l', xlab='datetime', ylab="Global_reactive_power")
  dev.off()
}