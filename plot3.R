data = read.csv("./household_power_consumption.txt", header = TRUE, sep = ";",
                na.strings = '?')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df<- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
png("plot3.png",width = 480, height = 480, units = "px")
plot(df$Sub_metering_1,type= "l",xlab="",xaxt= "n",ylab = "Energy sub metering")
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))
lines(df$Sub_metering_2,xlab = "",xaxt = "n", col= "red")
lines(df$Sub_metering_3,xlab = "",xaxt = "n", col= "blue")
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1, col = c("black","red","blue"))
dev.off() 
