

library(dplyr)
library(xtable)

# read the data into a dataframe
rawData <- read.csv("activity.csv", stringsAsFactors = FALSE)

# clean the data by selecting the steps and date columns
# then group by the data and sum the number of steps
cleanData <- rawData %>% 
             select(steps, date) %>%
             group_by(date) %>%
             summarize(steps = sum(steps))

# make the histogram as a barplot of the steps by date
with(cleanData, 
     barplot(steps, names.arg = date))

# build a table containing the mean and median number of steps
results <- matrix(c("mean daily steps", 
                    "median daily steps", 
                     mean(cleanData$steps, na.rm=TRUE), 
                     median(cleanData$steps, na.rm = TRUE)), 
                  nrow = 2, 
                  ncol = 2)

print.xtable(xtable(results), 
             type = getOption("xtable.type", "html"),
             include.rownames = getOption("xtable.include.rownames", FALSE),
             include.colnames = getOption("xtable.include.colnames", FALSE))
print(xtable(results), type = "html")

# clean a second data frame by selecting steps and interval columns
# then group by interval and compute the average steps in each group
moreData <- rawData %>%
            select(steps, interval) %>%
            group_by(interval) %>%
            summarize(avgsteps = mean(steps, na.rm=TRUE))

# plot a time series line using the interval as the time against the
# average steps.
with(moreData,
     plot(interval, avgsteps, type = "l"))

# determine the interval with the max steps by applying a filter
maxSteps <- max(moreData$avgsteps, na.rm = TRUE)
maxInterval <- filter(moreData, avgsteps == maxSteps)

# build a table of the selected interval and the number of max steps.
results2 <- matrix(c("interval with max steps", 
                     "maximum steps",
                      maxInterval$interval,
                      maxInterval$avgsteps),
                   nrow = 2,
                   ncol = 2)

print(xtable(results2), type = "html")

# determine the number of missing observations
missingData <- filter(rawData, is.na(steps))
numberMissing <- count(missingData)

# build a table to print the count of missing data
results3 <- matrix(c("number of missing observations", numberMissing),
                   nrow = 1,
                   ncol = 2)

print(xtable(results3), type = "html")

# fill in missing values by merging rawData with moreData and mutating
# steps where they are missing with the average for the interval
mergeData <- merge(rawData, moreData, by.x="interval", by.y="interval")
noMissingData <- mergeData %>% 
                 mutate(steps = ifelse(is.na(steps), avgsteps, steps)) %>% 
                 select(steps, date, interval)

# If I knew I was going to do this twice, I would have written a function. Now in
# the essence of time I using copy-and-paste coding.
# clean the data by selecting the steps and date columns
# then group by the data and sum the number of steps
newCleanData <- noMissingData %>% 
                select(steps, date) %>%
                group_by(date) %>%
                summarize(steps = sum(steps))

# make the histogram as a barplot of the steps by date
with(newCleanData, 
     barplot(steps, names.arg = date))

# build a table containing the mean and median number of steps
results4 <- matrix(c("mean daily steps", 
                     "median daily steps", 
                     mean(newCleanData$steps), 
                     median(newCleanData$steps)), 
                   nrow = 2, 
                   ncol = 2)

print(xtable(results4), type = "html")

# Create a dataframe that distinguishes between weekdays and weekends
# Distinguishing is accomplished by mutating the date string into a
# native date object. Then the day of the week is determined from the
# date. By checking for Sat or Sun, we determine if the day is a weekend
# of weekday. Weekends are assigned zero and weekdays one. Since intervals
# will always occur on the same day, we can take the MAX of the typeOfDay
# (or Min Or Mean).
weekdayData <- noMissingData %>%
               mutate(date = as.Date(date, "%Y-%m-%d"),
                      day = weekdays(date, abbreviate = TRUE),
                      typeOfDay = ifelse(day == "Sat" | day == "Sun", 0, 1))

weekdays <- weekdayData %>%
            filter(typeOfDay == 1) %>%
            group_by(interval) %>%
            summarize(avgsteps = mean(steps, na.rm=TRUE)) %>%
            select(avgsteps, interval)

weekends <- weekdayData %>%
            filter(typeOfDay == 0) %>%
            group_by(interval) %>%
            summarize(avgsteps = mean(steps, na.rm=TRUE)) %>%
            select(avgsteps, interval)

# plot each time series line using the interval as the time against the
# average steps as seperate charts.
with(weekdays, plot(interval, avgsteps, type = "l", main = "Weekdays"))
with(weekends, plot(interval, avgsteps, type = "l", main = "Weekends"))
