# Create plot1.png. See README.md for details.
# See README.md.
#
# by La Monte H.P. Yarroll <piggy+coursera@google.com>
# July 2014

# Extract the data we care about, 1 & 2 Feb 2007.
filename <- "household_power_consumption"
d <- read.table(unz(paste0(filename, ".zip"), paste0(filename, ".txt")),
                sep=";", na.strings="?",
                colClasses=c("character", "character", "numeric", "numeric",
                             "numeric", "numeric", "numeric",
			     "numeric", "numeric"),
                header=TRUE)

smalld <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]
smalld$datetime <- strptime(paste(smalld$Date, smalld$Time),
                            "%d/%m/%Y %H:%M:%S")

# Actually produce plot1.png.
png(filename="plot1.png", width=480, height=480)
hist(smalld$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
