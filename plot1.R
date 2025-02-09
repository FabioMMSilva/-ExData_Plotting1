# plot1.R: Script to generate plot1.png

# Load necessary libraries
library(ggplot2)

# Load the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Convert date and time
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter data for the required dates
filtered_data <- subset(data, as.Date(data$Datetime) >= as.Date("2007-02-01") & as.Date(data$Datetime) < as.Date("2007-02-03"))

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Plot histogram
hist(as.numeric(filtered_data$Global_active_power), breaks = 30, col = "blue", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Close device
dev.off()
