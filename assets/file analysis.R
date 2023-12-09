library(tidyverse)

# Loading in 911 Calls data
setwd("C:/Users/armvg/Desktop/CLASSES/2023-2024/FALL")
calls <- read.csv("GEOG 328/GEOG328-group10_final/assets/911calls.csv")

# Loading in Per Capita Income data
income <- read.csv("GEOG 328/GEOG328-group10_final/assets/PerCapitaIncome.csv")

# Reformatting the 'Datetime' column format for filtering compatibility
calls$Datetime <- as.POSIXct(strptime(calls$Datetime, format="%m/%d/%Y %I:%M:%S %p"))

# Filtering the 911 calls dataset to only include the relevant time frame
lowerThreshold <- as.POSIXct("2022-08-31 00:00:00", format="%Y-%m-%d %H:%M:%S", tz="UTC")
upperThreshold <- as.POSIXct("2023-08-31 00:00:00", format="%Y-%m-%d %H:%M:%S", tz="UTC")

newCalls <- filter(calls, (calls$Datetime > lowerThreshold & calls$Datetime < upperThreshold))

# Export the new calls dataset
write.csv(newCalls, "filtered911Calls.csv", row.names = FALSE)