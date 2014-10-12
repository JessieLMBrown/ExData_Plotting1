hhpower <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = TRUE)
feb1and2hhpower <- hhpower[hhpower$Date =="1/2/2007" | hhpower$Date =="2/2/2007", ]
feb1and2hhpower$Date <- strptime(feb1and2hhpower$Date, "%d/%m/%Y")
feb1and2hhpower$DT <- with(feb1and2hhpower, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
Global.Active.Power <- feb1and2hhpower[,"Global_active_power"]
Global.Active.Power.Nums <- as.numeric(Global.Active.Power) 
plot(feb1and2hhpower$DT, Global.Active.Power.Nums, pch = NA_integer_, ylab = "Global Active Power (kilowatts)", xlab = "")
lines(feb1and2hhpower$DT, Global.Active.Power.Nums)
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 