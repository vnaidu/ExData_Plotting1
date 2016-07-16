source("dataHelper.R")
source("plotHelper.R", local = TRUE)

pwrc <- GetData()

# Start plotting device using default options
startDev("plot2")

# Calculate date start/end for graph
plot(pwrc$DateTime,
     pwrc$Global_active_power,
     type = "l",
     xlab = "Day",
     ylab = "Global Active Power (kW)",
     cex.lab=0.7, cex.axis=0.8
)

# Close plotting device
closeDev()
