source("dataHelper.R")
source("plotHelper.R", local = TRUE)

pwrc <- GetData()

# Start plotting device using default options
startDev("plot3")

# Calculate date start/end for graph
start <- min(pwrc$DateTime)
end = start + days(2)

# Plot Graph
plot(pwrc$DateTime,
     pwrc$Sub_metering_1,
     xaxt="n",
     type="l",
     xlab="Day",
     ylab="Energy sub metering"
)
lines(pwrc$DateTime, pwrc$Sub_metering_2, col = "red")
lines(pwrc$DateTime, pwrc$Sub_metering_3, col = "blue")

axis.POSIXct(1, at=seq(start, end, by = "day"), format = "%a")
legend("topright",
       legend=c("Sub metering (1)", "Sub metering (2)", "Sub metering (3)"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

# Close plotting device
closeDev()
