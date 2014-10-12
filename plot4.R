hhpower <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = TRUE)
feb1and2hhpower <- hhpower[hhpower$Date =="1/2/2007" | hhpower$Date =="2/2/2007", ]
feb1and2hhpower$Date <- strptime(feb1and2hhpower$Date, "%d/%m/%Y")
feb1and2hhpower$DT <- with(feb1and2hhpower, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
Global.Active.Power <- feb1and2hhpower[,"Global_active_power"]
Global.Active.Power.Nums <- as.numeric(Global.Active.Power) 
Voltage <- as.numeric(feb1and2hhpower[,"Voltage"])
Global.Reactive.Power <- as.numeric((feb1and2hhpower[,"Global_reactive_power"]))

Sub.metering.1 <- as.numeric(feb1and2hhpower[,"Sub_metering_1"])
Sub.metering.2 <- as.numeric(feb1and2hhpower[,"Sub_metering_2"])
Sub.metering.3 <- as.numeric(feb1and2hhpower[,"Sub_metering_3"])

png(file="plot4.png", height=480, width=480) 
par(mfcol = c(2, 2))
with(feb1and2hhpower,{
    plot(feb1and2hhpower$DT, Global.Active.Power.Nums, pch = NA_integer_, ylab = "Global Active Power", xlab = "")
    lines(feb1and2hhpower$DT, Global.Active.Power.Nums)
    plot(feb1and2hhpower$DT, Sub.metering.1, pch = NA_integer_, ylab = "Energy sub metering", xlab = "")
    lines(feb1and2hhpower$DT, Sub.metering.1)
    lines(feb1and2hhpower$DT, Sub.metering.2, col = "Red")
    lines(feb1and2hhpower$DT, Sub.metering.3, col= "Blue")
    legend("topright", lty = 1, bty = "n", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(feb1and2hhpower$DT, Voltage, pch = NA_integer_, ylab = "Voltage", xlab = "datetime")
    lines(feb1and2hhpower$DT, Voltage)
    plot(feb1and2hhpower$DT, Global.Reactive.Power, pch = NA_integer_, ylab = "Global_reactive_power", xlab = "datetime")
    lines(feb1and2hhpower$DT, Global.Reactive.Power)
    })
dev.off() 