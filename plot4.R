# assuming file ("household_power_consumption.txt") is downloaded and subsetted for only data from the dates 2007-02-01 and 2007-02-02

# set layout for 2 x 2 chart window
par(mfrow = c(2,2))

# plot 1
plot(power0207$timestamp,power0207$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# plot 2
plot(power0207$timestamp,power0207$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot 3
plot(power0207$timestamp,power0207$Sub_metering_1, xlab="", ylab="Energy Submetering", type="l")
  # add sub meter 2
  lines(power0207$timestamp,power0207$Sub_metering_2, col = "red")
  # add sub meter 3
  lines(power0207$timestamp,power0207$Sub_metering_3, col = "blue")
  #add legend
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
#plot 4
plot(power0207$timestamp,power0207$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
# copy to png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()