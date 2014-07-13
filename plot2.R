#read the data
d <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
FebSubset <- subset(d, d$Date == "1/2/2007" | d$Date== "2/2/2007")
dates <- as.POSIXct(paste(FebSubset$Date,FebSubset$Time),format ="%d/%m/%Y %H:%M:%S")

#plot 2 to a PNG file
png(filename="plot2.png")
plot(dates, FebSubset$Global_active_power, type = "line", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab=0.75, cex.axis=0.75)
dev.off()