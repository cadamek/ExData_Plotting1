download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip", method = "curl")
power <- read.table(unz("power.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
closeAllConnections()

power$DateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S")
powerFeb <- power[power$DateTime >= "2007-02-01" & power$DateTime < "2007-02-03", ]

png("plot4.png")

par(mfrow = c(2,2))
par(cex.axis = 0.5)
par(cex.lab = 0.5)
par(mgp = c(1.5, 0.5, 0))

plot(powerFeb$DateTime, powerFeb$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
with(powerFeb, plot(DateTime, Voltage,
     type = "l", xlab = "dateTime", ylab = "Voltage"))

with(powerFeb, {plot(DateTime, Sub_metering_1, type = "l",
                     xlab = "", ylab = "Energy sub metering")
                lines(DateTime, Sub_metering_2, col = "red")
                lines(DateTime, Sub_metering_3, col = "blue")
                })
# with(powerFeb, lines(DateTime, Sub_metering_2, col = "red"))
# with(powerFeb, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 3, cex = 0.6, bty = "n")

with(powerFeb, {plot(DateTime, Global_reactive_power, type = "l",
                     xlab = "dateTime", ylab = "Global_reactive_power")})

dev.off()