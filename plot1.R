filename <- "household_power_consumption"
d <- read.table(unz(paste0(filename, ".zip"), paste0(filename, ".txt")),
                sep=";", na.strings="?",
                colClasses=c("character", "character", "numeric", "numeric",
                             "numeric", "numeric", "numeric", "numeric", "numeric"),
                header=TRUE)

smalld <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]

par(bg=rgb(red=1, green=1, blue=1, alpha=0))

png(filename="plot1.png", width=480, height=480)
hist(smalld$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

smalld$datetime <- strptime(paste(smalld$Date, smalld$Time), "%d/%m/%Y %H:%M:%S")

# plot2
with(smalld, plot(datetime, Global_active_power,
                  xlab="", ylab="Global Active Power (kilowatts)", type="l"))

# plot3
with(smalld, plot(datetime, Sub_metering_1, type="l",
                  ylab="Energy sub metering", xlab=""))
with(smalld, lines(datetime, Sub_metering_2, type="l", col="red"))
with(smalld, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot4c
with(smalld, plot(datetime, Voltage, type="l"))

# plot4d
with(smalld, plot(datetime, Global_reactive_power, type="l"))
