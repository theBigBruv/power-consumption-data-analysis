fileUrl <- "household_power_consumption.txt"

dftest <- read.table("household_power_consumption.txt", sep=";",header=T, na.strings="?")
dftest$Date <- as.Date(dftest$Date, format="%d/%m/%Y")

dfplot <- dftest[dftest$Date == "2007-02-01" | dftest$Date == "2007-02-02",]
dfplot$DateTime <- strptime(paste(dfplot$Date, dfplot$Time),format="%Y-%m-%d %H:%M:%S")

x <- dfplot$DateTime
a <- as.numeric(dfplot$Sub_metering_1)
b <- as.numeric(dfplot$Sub_metering_2)
c <- as.numeric(dfplot$Sub_metering_3)

with(dfplot, plot(x, a, type="n", ylab="Energy sub metering", xlab="DateTime"))
lines(x, a, type="l")
lines(x, b, type="l", col="red")
lines(x, c, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), cex=0.75)
dev.copy(png, file="plot3.png", width = 480, height = 480, units = "px")
dev.off()