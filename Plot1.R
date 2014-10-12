hhpower <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = TRUE)
feb1and2hhpower <- hhpower[hhpower$Date =="1/2/2007" | hhpower$Date =="2/2/2007", ]
Global.Active.Power <- feb1and2hhpower[,"Global_active_power"]
Global.Active.Power.Nums <- as.numeric(Global.Active.Power) 
hist(Global.Active.Power.Nums, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 

