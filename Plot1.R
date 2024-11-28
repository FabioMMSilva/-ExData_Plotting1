
png(filename = "Plot1.png", width = 480, height = 480)
hist(Global_active_power,col = "red", xlab = "Global active power (kilowwatts)", main = "Global Active Power")
dev.off()
rm(epc)
