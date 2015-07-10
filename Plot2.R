epc = read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
mydata =subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
#########################
# Plot 2
#########################
str(mydata)
mydata$datetime = paste(mydata$Date, mydata$Time)
head(mydata$datetime)
mydata$datetime = strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")
str(mydata)

plot(mydata$datetime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png")
dev.off()
