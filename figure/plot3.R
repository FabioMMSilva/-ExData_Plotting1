# plot3.R
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", 
     xlab = "", 
     ylab = "Energy Sub Metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
