# Loading the packages
library(tidyverse)

# Loading csv files
daily_activity <- read.csv("dailyActivity_merged.csv")
sleep_day <- read.csv("sleepDay_merged.csv")

# A quick view of the data
head(daily_activity)
colnames(daily_activity)
head(sleep_day)
colnames(sleep_day)

# Understanding some summary statistics
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)

nrow(daily_activity)
nrow(sleep_day)

# Quick summary statistics we'd want to know about each data frame?
#For the daily activity dataframe:
daily_activity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()

#For the sleep dataframe:
sleep_day %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()

# Plotting a few explorations
#What's the relationship between steps taken in a day and sedentary minutes?,
#How could this help inform the customer segments that we can market to?
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + 
  geom_point() + 
  geom_smooth(mapping = aes(x=TotalSteps, y=SedentaryMinutes))

# the relationship between minutes asleep and time in bed?
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + 
  geom_point() +
  geom_smooth(mapping = aes(x=TotalMinutesAsleep, y=TotalTimeInBed))

#combined_data <- merge(sleep_day, daily_activity, by="Id")

#n_distinct(combined_data$Id)















































































































































































