library(data.table)

dt <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
##Convert to class Date
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")
##Filter observations relavant to the assignment
dt <- dt[dt$Date == as.Date("2007-02-01") | dt$Date == as.Date("2007-02-02"), ]

##Combine Date/Time
dt$Time <- paste(dt$Date,dt$Time)
dt$Time <- strptime(dt$Time,"%Y-%m-%d %H:%M:%S")

dt$Global_active_power <- as.numeric(dt$Global_active_power)

##3
par(mfcol = c(1,1))
par(mar=c(2,4,1,2))
plot(dt$Time,dt$Sub_metering_1, type = "n", ylab="Energy sub metering")
lines(dt$Time,dt$Sub_metering_1)
lines(dt$Time,dt$Sub_metering_2,col="red")
lines(dt$Time,dt$Sub_metering_3,col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.6,
       col=c("black","red","blue"),text.width = strwidth("Sub_metering_1"),lty = 1 ,pt.cex = 1 )
dev.copy(png,file = "plot3.png")
dev.off()
