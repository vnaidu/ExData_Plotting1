# Purpose: to ensure dataset avaliabity for plot*.R scripts
# This is a data helper script that checks if the household power consumption
# dataset exists. If the dataset dosen't exist, check if the source '.zip' file
# exists (download if nonexistent) and unzip it.

datasetFPathTxt <- 'Data/household_power_consumption.txt'
datasetFPathZip <- 'Data/household_power_consumption.zip'
datasetSrcURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

if (!file.exists('Data/household_power_consumption.txt')) {
  if (!file.exists('Data/household_power_consumption.zip')) {
    download.file(datasetSrcURL, datasetFPathZip)
  }
  unzip(datasetFPathZip, exdir = 'Data/', overwrite = T)
}

