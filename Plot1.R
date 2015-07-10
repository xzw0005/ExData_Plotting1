#########################
# Plot 1
#########################
epc = read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
str(epc)
head(epc)
mydata =subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
hist(mydata$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot1.png")
dev.off()