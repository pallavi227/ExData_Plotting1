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


##4

par(mfcol = c(2,2))
par(mar=c(4,4,1,2))

plot(dt$Time,dt$Global_active_power, type = "n",xlab = "", ylab="Global Active Power")
lines(dt$Time,dt$Global_active_power)

plot(dt$Time,dt$Sub_metering_1, type = "n", xlab = "",ylab="Energy sub metering")
lines(dt$Time,dt$Sub_metering_1)
lines(dt$Time,dt$Sub_metering_2,col="red")
lines(dt$Time,dt$Sub_metering_3,col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.6,
       col=c("black","red","blue"),text.width = strwidth("Sub_metering_1"),lty = 1 ,bty = "n",pt.cex =1)

plot(dt$Time,dt$Voltage,type = "n" , xlab = "datetime",ylab="Voltage")
lines(dt$Time,dt$Voltage)

plot(dt$Time,dt$Global_reactive_power,type = "n" , xlab = "datetime",ylab="Global_reactive_power")
lines(dt$Time,dt$Global_reactive_power)
dev.copy(png,file = "plot4.png")
dev.off()
