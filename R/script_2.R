#AIRLINES SAFETY ANALYSIS#

air_safety<-read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", sep=",")
save(air_safety, file = "C:/Users/chiat/Documents/GitHub/f0e7a855/data/airsafety.rda")
load("~/GitHub/f0e7a855/data/airsafety.rda")

#Variables of the dataset
colnames(air_safety)
#Airlines envolved
airline<-air_safety$airline
head(airline)
#Summary statistics about the number of incidents for each airline between 1985 and 1999
summary(air_safety$incidents_85_99)
#Summary statistics about the number of incidents for each airline between 2000 and 2004
summary(air_safety$incidents_00_14)
#Decrease in the minimum and maximum number of incidents
r1<-range(air_safety$incidents_85_99)
r2<-range(air_safety$incidents_00_14)
r1-r2
#Summary statistics about the number of fatal accidents for each airline between 1985 and 1999
summary(air_safety$fatal_accidents_85_99)
#Summary statistics about the number of fatal accidents for each airline between 2000 and 2004
summary(air_safety$fatal_accidents_00_14)

#Create a new variable called "Fatal accidents rate", given by the number of
#fatal accidents in 2000-2014 over the number of incidents in 2000-2014
fa_rate<-air_safety$fatal_accidents_00_14/air_safety$incidents_00_14
head(fa_rate)
#Add the new variable to the dataset
air_safety<-cbind(air_safety,fa_rate)
#Check the dimensions of the dataset
dim(air_safety)
#Add a new variable called "safety", which returns TRUE if the fatal accidents rate
#of the airline is smaller than 0.2, otherwise it returns FALSE
library(tidyverse)    #package for the "mutate" function
air_safety<-air_safety %>%
  mutate(safety = fa_rate<0.2)
#Check the dimensions of the dataset
dim(air_safety)
View(air_safety)

#Data Visualization with plotly
#Install and load the package
library(plotly)
#Barplot representing the number of fatal accidents for each airline in the two periods
b <- plot_ly(air_safety, x = ~airline, y = ~air_safety$fatal_accidents_85_99, type = 'bar', name = '1985-1999') %>%
  add_trace(y = ~air_safety$fatal_accidents_00_14, name = '2000-2014') %>%
  layout(yaxis = list(title = 'Number of Fatal Incidents 1985-1999'), barmode = 'Airline')
b

p <- plot_ly(air_safety, labels = ~air_safety$safety, type = 'pie') %>%
  layout(title = 'Percentage of safe airlines according to the fatal accidents rate',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p

#Data Analysis

#Install and load the package gmodels
library(gmodels)
#CrossTable
CrossTable(air_safety$fatal_accidents_00_14,air_safety$safety,prop.chisq=FALSE)
#From this crosstable we see that:
#-only 47 observations (airlines) are taken into account because there are 9 NAs in the variable safety
#-49% of the airlines taken into account is considered safe, with zero fatal accidents in the period 2000-2014
#-within the safe airlines, 79.3% had zero fatal accidents in the period 2000-2014, 6.9% had 1 fatal accident,
#10.3% had two fatal accidents and 3.4% had three fatal accidents

#Install and load the package corrplot
library(corrplot)
#Correlation between the numeric variables in the dataset
numeric.var<-sapply(air_safety,is.numeric)
corr.matrix<-cor(air_safety[,numeric.var])
corrplot(corr.matrix,main="\n\nCorrelation Matrix",method="number")

#Simple Linear Regression
reg_1<-lm(air_safety$fatal_accidents_00_14~air_safety$incidents_00_14, data=air_safety)
summary(reg_1)
#Multiple Linear Regressions
reg_2<-lm(air_safety$fatal_accidents_00_14~air_safety$incidents_00_14+air_safety$fatalities_00_14, data=air_safety)
summary(reg_2)
reg_3<-lm(air_safety$fatal_accidents_00_14~air_safety$incidents_00_14+air_safety$fatalities_00_14+air_safety$incidents_85_99, data=air_safety)
summary(reg_3)
#Choose regression 2
