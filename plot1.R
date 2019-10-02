#Plot 1 Global Active Power
power <- read.table("power.txt", header = TRUE, sep = ";", na.strings = "?")

#subset data for 2007-02-01 and 2007-02-02
FebDays <- filter(power, Date == "2/2/2007" | Date == "1/2/2007")


#Create histogram
hist(FebDays$Global_active_power, 
    main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

#Save to PNG with w/h of 480 * 480 pixels
png("rplot1.png", width = 480, height = 480)
hist(FebDays$Global_active_power, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
