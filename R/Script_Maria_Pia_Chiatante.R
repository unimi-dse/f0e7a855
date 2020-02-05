#AIRLINES SAFETY ANALYSIS#


airsafety <- function() {

  #Import the dataset
  air_safety<-read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", sep=",")
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

  #Data Visualization with plotly
  #Install and load the package
  install.packages("plotly")
  library(plotly)
  #Barplot representing the number of fatal accidents for each airline in the two periods
  b <- plot_ly(air_safety, x = ~airline, y = ~air_safety$fatal_accidents_85_99, type = 'bar', name = '1985-1999') %>%
    add_trace(y = ~air_safety$fatal_accidents_00_14, name = '2000-2014') %>%
    layout(yaxis = list(title = 'Number of Fatal Incidents 1985-1999'), barmode = 'Airline')
  b

  p <- plot_ly(air_safety, labels = ~air_safety$safety, type = 'pie',
               marker = list(color = c("green", "red", "gray"))) %>%
    layout(title = 'Percentage of safe airlines according to the fatal accidents rate',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  p

  ##
  tab <- aggregate( fatal_accidents_85_99 ~ airline, data=air_safety, FUN=sum)

  nFInc<- function(airline) {
    return(tab[airline,2])
    }

  nFInc<- function(airline) {
    for (i in airline) {
      return(tab[i,2])
    }
  }


  for (i in tab$airline) {
    print(tab[i,2])
  }

}
