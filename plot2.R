fileUrl <- "household_power_consumption.txt"

dftest <- read.table("household_power_consumption.txt", sep=";",header=T, na.strings="?")
dftest$Date <- as.Date(dftest$Date, format="%d/%m/%Y")

dfplot <- dftest[dftest$Date == "2007-02-01" | dftest$Date == "2007-02-02",]
dfplot$DateTime <- strptime(paste(dfplot$Date, dfplot$Time),format="%Y-%m-%d %H:%M:%S")

x <- dfplot$DateTime
y <- as.numeric(dfplot$Global_active_power)

with(dfplot, plot(x, y, type="n", ylab="Global Active Power (kilowatts)", xlab="DateTime"))
lines(x, y, type="l")
dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px")
dev.off()
