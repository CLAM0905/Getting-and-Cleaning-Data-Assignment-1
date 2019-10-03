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
#(did not need) library(lubridate)
#(did not need)FebDays$wday <- wday(FebDays$DateTime, label=TRUE) 
#(did not need)FebDays$wday2 <- FebDays$wday

#Create histogram
plot(FebDays$DateTime, FebDays$Global_active_power, type = "l", lty = 1, xlab = " ", ylab = "Global Active Power (kilowatts)")

#Save to PNG with w/h of 480 * 480 pixels
png("rplot2.png", width = 480, height = 480)
plot(FebDays$DateTime, FebDays$Global_active_power, type = "l", lty = 1, xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
