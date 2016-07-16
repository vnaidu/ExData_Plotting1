source("dataHelper.R")
source("plotHelper.R", local = TRUE)

pwrc <- GetData()

# Start plotting device using default options
startDev("plot4")

# Calculate date start/end for graph
start <- min(pwrc$DateTime)
end = start + days(2)

# Set 2x2 grid for plot output
par(mfrow=c(2,2))

plot(pwrc$DateTime,
     pwrc$Global_active_power,
     xlim=c(start, end),
     xaxt="n",
     type="l",
     xlab="Day",
     ylab="Global Active Power"
)
axis.POSIXct(1, at=seq(start, end, by="day"), format="%a")

plot(pwrc$DateTime,
     pwrc$Voltage,
     xlim=c(start, end),
     xaxt="n",
     type="l",
     xlab="Day",
     ylab="Voltage"
)
axis.POSIXct(1, at=seq(start, end, by="day"), format="%a")

plot(pwrc$DateTime,
     pwrc$Sub_metering_1,
     xlim=c(start, end),
     xaxt="n",
     type="l",
     xlab="Day",
     ylab="Energy sub metering"
)

lines(pwrc$DateTime, pwrc$Sub_metering_2, col="red")
lines(pwrc$DateTime, pwrc$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(start, end, by="day"), format="%a")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1, 1, 1))

plot(pwrc$DateTime,
     pwrc$Global_reactive_power,
     xlim=c(start, end),
     xaxt="n",
     type="l",
     xlab="Day",
     ylab="Global Reactive Power"
)
axis.POSIXct(1, at=seq(start, end, by="day"), format="%a")

# Close plotting device
closeDev()
