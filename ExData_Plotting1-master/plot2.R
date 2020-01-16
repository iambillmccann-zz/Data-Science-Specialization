##
## plot2
## Bill McCann
## May 7, 2015
##
## This script displays a plot of global active power over time
##
library(dplyr)
library(lubridate)
#  Read the data into a dataframe and select only the appropriate dates
#  dates are dd/mm/yyyy
powerData <- read.csv("household_power_consumption.txt",na.strings="?",sep=";", stringsAsFactors=FALSE)
powerData <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")
powerData <- mutate(powerData, dateTime=dmy_hms(paste(powerData$Date, powerData$Time)))

#set up the file
png("plot2.png", width=480, height=480)

# create the plot of type "l" (lines)
with(powerData, 
     plot(dateTime, 
          Global_active_power, 
          type="l", 
          xlab="", 
          ylab="Global Active Power (kilowatts)"))

dev.off()