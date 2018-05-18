# Course 5 - Exploratory Data Analysis: Course Project
# Author: Sanjay Lonkar
# Date: 18-May-2018


# TASK 1: Download dataset

# Get the data 
if (!file.exists("./downloadedDataset"))
{
  dir.create("./downloadedDataset")
}
if (!file.exists ("./downloadedDataset/exdata%2Fdata%2Fhousehold_power_consumption.zip")) # This step is to avoid downloading data every time one runs this script
{
  datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file (datasetURL, destfile="./downloadedDataset/downloadedDataset.zip")
  unzip (zipfile = "./downloadedDataset/downloadedDataset.zip", exdir="./downloadedDataset")
}

# TASK 2: Prepare dataset 

# Get all the data 
completeData <- read.table("./downloadedDataset/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Get subset of data for the dates the dates 2007-02-01 and 2007-02-02
selectedData <- subset(completeData, completeData$Date == "1/2/2007" | completeData$Date == "2/2/2007")


# TASK 3: Plot and save graph in plot2.png file
dateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric (selectedData$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()