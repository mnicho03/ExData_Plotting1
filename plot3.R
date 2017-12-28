# assuming file ("household_power_consumption.txt") is downloaded and subsetted for only data from the dates 2007-02-01 and 2007-02-02

# create initial line plot for sub meter 1
plot(power0207$timestamp,power0207$Sub_metering_1, xlab="", ylab="Energy Submetering", type="l")

# add sub meter 2
lines(power0207$timestamp,power0207$Sub_metering_2, col = "red")

# add sub meter 3
lines(power0207$timestamp,power0207$Sub_metering_3, col = "blue")

#add legend
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))


# copy to png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()