# plot2.R: Script to generate plot2.png

# Load necessary libraries
library(ggplot2)

# Load the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Convert date and time
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter data for the required dates
filtered_data <- subset(data, as.Date(data$Datetime) >= as.Date("2007-02-01") & as.Date(data$Datetime) < as.Date("2007-02-03"))

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Plot time series
plot(filtered_data$Datetime, as.numeric(filtered_data$Global_active_power), type = "l", col = "blue", xlab = "Datetime", ylab = "Global Active Power (kilowatts)", main = "Global Active Power Over Time")

# Close device
dev.off()
