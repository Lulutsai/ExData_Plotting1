png(filename = "plot1.png")

##Read just the data from the two desired days
columnnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = columnnames, sep = ";", na.strings = "?", nrows = 2880, skip = 66637)

##Generate a histogram of Global Active Power with the appropriate title, X axis label, and red bars
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

dev.off()