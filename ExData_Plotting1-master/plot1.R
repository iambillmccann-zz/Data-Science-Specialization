##
## plot1
## Bill McCann
## May 7, 2015
##
## This script displays a histogram of the frequency of Global Active Power
##
library(dplyr)

#  Read the data into a dataframe and select only the appropriate dates
powerData <- read.csv("household_power_consumption.txt",na.strings="?",sep=";")
powerData <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")     # dates are dd/mm/yyyy

#set up the file
png("plot1.png", width=480, height=480)

#  Create the histogram
with(powerData, 
     hist(Global_active_power, 
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)",
          col = "red"))

dev.off()