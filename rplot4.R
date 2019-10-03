#Plot 1 Global Active Power
power <- read.table("power.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#subset data for 2007-02-01 and 2007-02-02
library(dplyr)
FebDays <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")

#Add day of the week
FebDays$Day <- FebDays$Date
FebDays$Day[FebDays$Day== '1/2/2007'] <- 'Thu'
FebDays$Day[FebDays$Day== '2/2/2007'] <- 'Fri'
FebDays$DateTime <- strptime(paste(FebDays$Date, FebDays$Time), format="%d/%m/%Y %H:%M:%S")

#Create histogram
par(mfrow =c(2,2), mar=c(4,5,4,5))
plot(FebDays$DateTime, FebDays$Global_active_power, type = "l", lty = 1, xlab = " ", ylab = "Global Active Power (kilowatts)")
plot(FebDays$DateTime, FebDays$Voltage, type = "l", lty = 1, xlab = "datetime", ylab = "Voltage")
plot(FebDays$DateTime, FebDays$Sub_metering_1, type ="l", col ="black", xlab = " ", ylab = "Energy sub metering")
lines(FebDays$DateTime,FebDays$Sub_metering_2, type ="l", col ="red", lty = 1)
lines(FebDays$DateTime,FebDays$Sub_metering_3, type ="l", col ="blue", lty = 1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bg = "white", lwd = 2, bty = "n")
plot(FebDays$DateTime, FebDays$Global_reactive_power, type = "l", lty = 1, xlab = "datetime", ylab = "Global_ reactive_power")

#Save to PNG with w/h of 480 * 480 pixels
png("rplot4.png", width = 480, height = 480)
par(mfrow =c(2,2), mar=c(4,4,4,4))
plot(FebDays$DateTime, FebDays$Global_active_power, type = "l", lty = 1, xlab = " ", ylab = "Global Active Power (kilowatts)")
plot(FebDays$DateTime, FebDays$Voltage, type = "l", lty = 1, xlab = "datetime", ylab = "Voltage")
plot(FebDays$DateTime, FebDays$Sub_metering_1, type ="l", col ="black", xlab = " ", ylab = "Energy sub metering")
lines(FebDays$DateTime,FebDays$Sub_metering_2, type ="l", col ="red", lty = 1)
lines(FebDays$DateTime,FebDays$Sub_metering_3, type ="l", col ="blue", lty = 1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bg = "white", lwd = 2, bty = "n")
plot(FebDays$DateTime, FebDays$Global_reactive_power, type = "l", lty = 1, xlab = "datetime", ylab = "Global_ reactive_power")
dev.off()