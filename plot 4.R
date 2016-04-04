#4. 
a<-household_power_consumption
in.dates<- a[a[,1] %in% c("1/2/2007","2/2/2007"),]

#str(subSetData)
datetime <- strptime(paste(in.dates$Date, in.dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(in.dates$Global_active_power)
globalReactivePower <- as.numeric(in.dates$Global_reactive_power)
voltage <- as.numeric(in.dates$Voltage)
sub1 <- as.numeric(in.dates$Sub_metering_1)
sub2 <- as.numeric(in.dates$Sub_metering_2)
sub3 <- as.numeric(in.dates$Sub_metering_3)


png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
