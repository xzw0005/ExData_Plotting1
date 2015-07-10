epc = read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
mydata =subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
mydata$datetime = paste(mydata$Date, mydata$Time)
mydata$datetime = strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")
#########################
# Plot 4
#########################
par(mfcol = c(2, 2))
png("Plot4.png")
plot(mydata$datetime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

colors = c("black", "red", "blue")
legText = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(mydata$datetime, mydata$Sub_metering_1, col = colors[1], type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(mydata$datetime, mydata$Sub_metering_2, col = colors[2], type = "l")
lines(mydata$datetime, mydata$Sub_metering_3, col = colors[3], type = "l")
legend("topright", legText, col = colors, lwd = 1)

plot(mydata$datetime, mydata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(mydata$datetime, mydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#dev.copy(png, file = "Plot4.png")
dev.off()
par(mfcol = c(1, 1))