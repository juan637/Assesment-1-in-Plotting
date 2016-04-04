a<-household_power_consumption
in.dates<- a[a[,1] %in% c("1/2/2007","2/2/2007"),]

#str(subSetData)
datetime <- strptime(paste(in.dates$Date, in.dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(in.dates$Global_active_power)
sub1 <- as.numeric(in.dates$Sub_metering_1)
sub2 <- as.numeric(in.dates$Sub_metering_2)
sub3 <- as.numeric(in.dates$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
