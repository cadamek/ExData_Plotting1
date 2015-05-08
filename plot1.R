download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip", method = "curl")
power <- read.table(unz("power.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
closeAllConnections()

power$DateTime <- strptime(paste(power$Date, power$Time), 
                           format = "%d/%m/%Y %H:%M:%S")
powerFeb <- power[power$DateTime >= "2007-02-01" & power$DateTime < "2007-02-03", ]

par(mgp = c(2, 0.5, 0))

png("plot1.png")
hist(powerFeb$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active (kilowatt)",
     col = "red", cex.axis = 0.5, cex.lab = 0.75)
dev.off()