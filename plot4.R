#Initialize directory
dim <- 480
dir = "E:/ExData_Plotting1"
data_src = paste(dir, "household_power_consumption.txt", sep = "/")
setwd(dir)

#Read in and clean data.
power_con <- read.table(data_src, sep=';', header = TRUE)
power_con$dt <- strptime(paste(power_con[,1], power_con[,2]), "%d/%m/%Y %H:%M:%S")
power_con$Date <- as.Date(power_con$Date, '%d/%m/%Y')
power_con <- subset(power_con, power_con$Date >= as.Date("2007-02-01") & power_con$Date <= as.Date("2007-02-02"))
for(i in c(3:9)){
  power_con[,i] <- as.numeric(power_con[,i])
}

#Open up the proper graphics file.
png(file = "plot4.png", height = dim, width = dim)
#Set that we're creating 2x2 plots side by side.
par(mfcol = c(2,2))

#Create top-left plot as in plot2.R
plot(power_con$dt, power_con$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
#Create bottom-left plot as in plot3.R
plot(power_con$dt, power_con$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(power_con$dt, power_con$Sub_metering_2, type="l", col = "red")
lines(power_con$dt, power_con$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
#Create top-right plot.
plot(power_con$dt, power_con$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
#Create bottom-right plot.
plot(power_con$dt, power_con$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#Close graphics device.
dev.off()