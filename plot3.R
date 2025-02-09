# plot3.R: Script to generate plot3.png

# Load necessary libraries
library(ggplot2)

# Load the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Convert date and time
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter data for the required dates
filtered_data <- subset(data, as.Date(data$Datetime) >= as.Date("2007-02-01") & as.Date(data$Datetime) < as.Date("2007-02-03"))

# Open PNG device
png("plot3.png", width = 480, height = 480)

# Plot energy sub metering
plot(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_1), type = "l", col = "black", xlab = "Datetime", ylab = "Energy sub metering", main = "Energy Sub Metering Over Time")
lines(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_2), col = "red")
lines(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Close device
dev.off()
