a<-household_power_consumption
library(lubridate)
strptime(a[,1],format="",tz="")
strptime(a[,2],format="%H:%M:%S",tz="")

#2.
##subsetting by dates
in.dates<- a[a[,1] %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(in.dates$Date, in.dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(in.dates$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png(filename = "plot2.png",
    width = 480, height = 480)
dev.off()
