# Create plot1.png. See README.md for details.  Copy
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# to "household_power_consumption.zip in the current directory and
# then from R,
# source("plot1.R")
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

# The reference images have a completely transparent background.
par(bg=rgb(red=1, green=1, blue=1, alpha=0))

# Actually produce plot2.png.
png(filename="plot2.png", width=480, height=480)
with(smalld, plot(datetime, Global_active_power,
                  xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()
