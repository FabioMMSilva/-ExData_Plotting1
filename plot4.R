# plot4.R: Script to generate plot4.png

# Load necessary libraries
library(ggplot2)

# Load the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Convert date and time
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter data for the required dates
filtered_data <- subset(data, as.Date(data$Datetime) >= as.Date("2007-02-01") & as.Date(data$Datetime) < as.Date("2007-02-03"))

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set up a 2x2 plotting layout
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(filtered_data$Datetime, as.numeric(filtered_data$Global_active_power), type = "l", col = "blue", xlab = "", ylab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Plot 2: Voltage
plot(filtered_data$Datetime, as.numeric(filtered_data$Voltage), type = "l", col = "green", xlab = "Datetime", ylab = "Voltage (volts)", main = "Voltage")

# Plot 3: Energy Sub Metering
plot(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_1), type = "l", col = "black", xlab = "Datetime", ylab = "Energy sub metering", main = "Energy Sub Metering")
lines(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_2), col = "red")
lines(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Plot 4: Global Reactive Power
plot(filtered_data$Datetime, as.numeric(filtered_data$Global_reactive_power), type = "l", col = "purple", xlab = "Datetime", ylab = "Global Reactive Power (kilowatts)", main = "Global Reactive Power")

# Close device
dev.off()
