png(filename = "plot2.png")

##Read just the data from the two desired days
columnnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = columnnames, sep = ";", na.strings = "?", nrows = 2880, skip = 66637)

##Convert the date and time columns to POSIX format and append to the data frame
DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %T")
data_DateTime <- data.frame(data, DateTime)

##Generate a line plot of Global Active Power vs. day of the week with the Y axis label
plot(data_DateTime$DateTime, data_DateTime$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()