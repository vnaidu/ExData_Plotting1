# Purpose: to ensure dataset avaliabity for plot*.R scripts
# This is a data helper script that checks if the household power consumption
# dataset exists. If the dataset dosen't exist, check if the source Zip
# archive file exists (download if nonexistent) and unzip it.

library(readr)
library(dplyr)
library(magrittr)
library(lubridate)

txtFPathDefault <- 'Data/household_power_consumption.txt'
zipFPathDefault <- 'Data/household_power_consumption.zip'
zipSrcURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

CheckOrDlData <- function(txtFPath, zipFPath=zipFPathDefault){
  if (!file.exists(txtFPath)) {
    if (!file.exists(zipFPath)) {
      zipFPath <- zipFPathDefault
      download.file(zipSrcURL, zipFPath)
    }
    unzip(zipFPath, exdir = 'Data/', overwrite = T)
    txtFPath <- txtFPathDefault
    if (file.exists(txtFPath)) {
      return(txtFPath)
    } else {
      print(paste0('Error: extracting ', zipFPath, ' FAILED'))
      return(FALSE)
    }
  } else {
    return(txtFPath)
  }
}

ParseData <- function(txtFPath) {
  txtFPath <- 'Data/household_power_consumption.txt'
  validFPath <- CheckOrDlData(txtFPath)
  dataTmp <- read.table(validFPath, header = T, sep = ';')
  data <- read_delim(validFPath, delim = ';', col_names = T)
  data$Date <- as.Date(as.character(dataTmp$Date), format="%d/%m/%Y")
  #data$Time <- as.hms(dataTmp$Time)
  data$Time <- as.character(dataTmp$Time)
  data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))
  return(data)
}

GetData <- function(txtFPath = txtFPathDefault, allDates = F) {
  data <- ParseData(txtFPath)
  if (allDates) {
    return(data)
  } else {
    data %>%
      filter(Date >= date('2007-02-01'), Date < date('2007-02-03')) %>%
      return()
  }
}
