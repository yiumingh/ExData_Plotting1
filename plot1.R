plot1 = function() {
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  Global_active_power <- gsub(",", "", data$Global_active_power)
  Global_active_power <- as.numeric(Global_active_power)
  png("plot1.png", width=480, height=480)
  
  hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}
