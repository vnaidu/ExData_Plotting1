source("dataHelper.R")
source("plotHelper.R", local = TRUE)
library(dplyr)

pwrc <- GetData()

startDev('plot1')
hist(
  pwrc$Global_active_power,
  main = "Global Active Power",
  col = "red",
  xlab = "Global Active Power (kW)"
)
closeDev()
