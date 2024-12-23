# plot4.R
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Top-left
plot(data$DateTime, data$Global_active_power, type = "l", 
     xlab = "", 
     ylab = "Global Active Power")
# Top-right
plot(data$DateTime, data$Voltage, type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")
# Bottom-left
plot(data$DateTime, data$Sub_metering_1, type = "l", 
     xlab = "", 
     ylab = "Energy Sub Metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")
# Bottom-right
plot(data$DateTime, data$Global_reactive_power, type = "l", 
     xlab = "datetime", 
     ylab = "Global Reactive Power")
dev.off()
