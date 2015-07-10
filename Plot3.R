epc = read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
mydata =subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
mydata$datetime = paste(mydata$Date, mydata$Time)
mydata$datetime = strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")
#########################
# Plot 3
#########################
png("Plot3.png")
colors = c("black", "red", "blue")
#legText = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legText = rep(NA, 3)
plot(mydata$datetime, mydata$Sub_metering_1, type = "n", #type = "l",
     xlab = "", ylab = "Energy sub metering")
for (i in 1:3) {
  lines(mydata$datetime, mydata[, 6+i], col = colors[i], type = "l")
  legText[i] = paste("Sub_metering_", i, sep = "")
}
legend("topright", legText, col = colors, lwd = 1)
#dev.copy(png, file = "Plot3.png")
dev.off()
