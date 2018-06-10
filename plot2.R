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

#Create basic line chart of global active power over time.
png(file="plot2.png", width=dim, height = dim)
plot(power_con$dt, power_con$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()