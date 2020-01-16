##
## plot3
## Bill McCann
## May 8, 2015
##
## This script displays a plot of energy sub meterings over time
##
library(dplyr)
library(lubridate)
#  Read the data into a dataframe and select only the appropriate dates
#  dates are dd/mm/yyyy
powerData <- read.csv("household_power_consumption.txt",na.strings="?",sep=";", stringsAsFactors=FALSE)
powerData <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")
powerData <- mutate(powerData, dateTime=dmy_hms(paste(powerData$Date, powerData$Time)))

#set up the file
png("plot3.png", width=480, height=480)

# create the plot of type "l" (lines)
with(powerData,
     {
         plot(dateTime, 
              Sub_metering_1, 
              type="l", 
              xlab="", 
              ylab="Energy sub metering")
         lines(dateTime,
               Sub_metering_2,
               col="red")
         lines(dateTime,
               Sub_metering_3,
               col="blue")
     })
legend("topright", 
       col=c("black", "red", "blue"), 
       lty="solid",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()