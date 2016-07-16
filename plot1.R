source("dataHelper.R")
source("plotHelper.R", local = TRUE)

pwrc <- GetData()

# Start plotting device using default options
startDev("plot1")

# Calculate date start/end for graph
hist(
  pwrc$Global_active_power,
  main = "Global Active Power",
  col = "red",
  xlab = "Global Active Power (kW)"
)

# Close plotting device
closeDev()
