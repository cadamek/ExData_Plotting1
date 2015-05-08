download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip", method = "curl")
power <- read.table(unz("power.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
closeAllConnections()

power$DateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S")
powerFeb <- power[power$DateTime >= "2007-02-01" & power$DateTime < "2007-02-03", ]

png("plot3.png")
par(mgp = c(2, 0.5, 0))
with(powerFeb, {
  plot(DateTime, Sub_metering_1, type = "l", xlab = "",
       ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  })
legend("topright", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 3)
dev.off()