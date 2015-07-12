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

##2
par(mfcol = c(1,1))
par(mar=c(2,4,1,2))
plot(dt$Time,dt$Global_active_power, type = "n", ylab="Global Active Power (kilowatts)")
lines(dt$Time,dt$Global_active_power)
dev.copy(png,file = "plot2.png")
dev.off()
