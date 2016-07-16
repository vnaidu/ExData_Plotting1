source("dataHelper.R")
source("plotHelper.R", local = TRUE)

pwrc <- GetData()

# Plot 1
startDev('plot1')
hist(
  pwrc$Global_active_power,
  main = "Global Active Power",
  col = "red",
  xlab = "Global Active Power (kW)"
)
closeDev()

# Plot 2
startDev('plot2')
plot(pwrc$DateTime,
     pwrc$Global_active_power,
     type = 'l',
     xlab = "",
     ylab = "Global Active Power (kW)",
     cex.lab=0.7, cex.axis=0.8
)
closeDev()

# Plot 3
startDev('plot3')
plot(pwrc$DateTime,
     pwrc$Sub_metering_1,
     xaxt="n",
     type="l",
     xlab="Day",
     ylab="Energy sub metering"
)
lines(pwrc$DateTime, pwrc$Sub_metering_2, col="red")
lines(pwrc$DateTime, pwrc$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(start, end, by="day"), format="%a")
legend("topright",
       legend=c('Sub metering (1)', 'Sub metering (2)', 'Sub metering (3)'),
       col=c('black', 'red', 'blue'),
       lty=c(1, 1, 1))
closeDev()

# Plot 4
startDev('plot4')

start <- min(pwrc$DateTime)
end = start + days(2)

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
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty=c(1, 1, 1))

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
