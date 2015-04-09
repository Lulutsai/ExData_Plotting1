png(filename = "plot4.png")

##Read just the data from the two desired days
columnnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = columnnames, sep = ";", na.strings = "?", nrows = 2880, skip = 66637)

##Convert the date and time columns to POSIX format and append to the data frame
DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")
data_DateTime <- data.frame(data, DateTime)

##Generate a blank plot 
par(mfrow = c(2, 2))

##Fill in the plots as pictured in the project description
plot(data_DateTime$DateTime, data_DateTime$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(data_DateTime$DateTime, data_DateTime$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(data_DateTime$DateTime, data_DateTime$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data_DateTime$DateTime, data_DateTime$Sub_metering_2, type = "l", col = "red")
points(data_DateTime$DateTime, data_DateTime$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty = "n", col = c("black", "red", "blue"))
plot(data_DateTime$DateTime, data_DateTime$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()