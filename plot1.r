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


##1
par(mfcol = c(1,1))
par(mar=c(4.1,4.1,2,2))
hist(dt$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.copy(png,file = "plot1.png")
dev.off()
