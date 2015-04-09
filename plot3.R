png(filename = "plot3.png")

##Read just the data from the two desired days
columnnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = columnnames, sep = ";", na.strings = "?", nrows = 2880, skip = 66637)

##Convert the date and time columns to POSIX format and append to the data frame
DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")
data_DateTime <- data.frame(data, DateTime)

##Generate a line plot of the sub-metered values vs. day of the week with the appropriate Y axis label and legend
plot(data_DateTime$DateTime, data_DateTime$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data_DateTime$DateTime, data_DateTime$Sub_metering_2, type = "l", col = "red")
points(data_DateTime$DateTime, data_DateTime$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"))

dev.off()