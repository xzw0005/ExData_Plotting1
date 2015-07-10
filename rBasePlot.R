library(datasets)
hist(airquality$Ozone, breaks = 20)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

airquality = transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")
colors()

x = rnorm(100)
hist(x)
y = rnorm(100)
plot(x, y, pch = 20)
title("Scatterplot")
text(-2, -2, "haha")
legend("topleft", legend = "Data", pch = 20)
abline(lm(y ~ x), lwd = 3, col = "blue")

plot(x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)

g = gl(2, 50, labels = c("Male", "Female"))
str(g)
x = rnorm(100)
y = x + rnorm(100)
plot(x, y, type = "n")
points(x[g=="Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "blue")

setwd("F:/Coursera/DataScience_JohnsHopkins/4_ExporatoryDataAnalysis/proj1")
getwd()
pdf(file = "myplot.pdf") # open PDF device
library(datasets)
with(faithful, plot(eruptions, waiting)) 
title(main = "old faithful geyser data")
dev.off() # close the PDF device

dev.copy(png, file = "mypng.png")
dev.off()


setwd("F:/Coursera/DataScience_JohnsHopkins/4_ExporatoryDataAnalysis/proj1")
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
#mydata$Date = as.Date(mydata$Date, "%d/%m/%Y")

#epc$Date = as.Date(epc$Date, "%d/%m/%Y")
#mydata = subset(epc, Date == "2007-02-01" | Date == "2007-02-02")

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
legend("topright", legText, col = colors, lwd = 2)
#dev.copy(png, file = "Plot3.png")
dev.off()

#########################
# Plot 4
#########################
par(mfcol = c(2, 2))
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

dev.copy(png, file = "Plot4.png")
dev.off()
par(mfcol = c(1, 1))