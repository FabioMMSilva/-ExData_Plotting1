
source("LoadData.R")
png(filename = "Plot2.png", width = 480, height = 480)
plot(Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(side = 1, at = seq(1,2880, by = 1439), labels = c("Thu", "Fri", "Sat"))
dev.off()
rm(epc)
