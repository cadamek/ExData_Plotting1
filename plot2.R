download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip", method = "curl")
power <- read.table(unz("power.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
closeAllConnections()

power$DateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S")
powerFeb <- power[power$DateTime >= "2007-02-01" & power$DateTime < "2007-02-03", ]

par(mgp = c(2, 0.5, 0))

png("plot2.png")
plot(powerFeb$DateTime, powerFeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()