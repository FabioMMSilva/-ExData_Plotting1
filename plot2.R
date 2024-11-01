
data = read.csv("./household_power_consumption.txt", header = TRUE, sep = ";",
                na.strings = '?')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df<- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
png("plot2.png",width = 480, height = 480, units = "px")
plot(df$Global_active_power,type= "l",xlab="",xaxt= "n")
axis(1, at = c(0,1441,2881), labels = c("Thu","Fri","Sat"))
dev.off()
