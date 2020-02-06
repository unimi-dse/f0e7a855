#AIRLINES SAFETY ANALYSIS#
air_safety<-read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv", sep=",")
save(air_safety, file = "C:/Users/chiat/Documents/GitHub/f0e7a855/data/airsafety.rda")
load("~/GitHub/f0e7a855/data/airsafety.rda")

prepare <- function() {
  #Create a new variable called "Fatal accidents rate", given by the number of
  #fatal accidents in 2000-2014 over the number of incidents in 2000-2014
  fa_rate<-air_safety$fatal_accidents_00_14/air_safety$incidents_00_14
  #Add the new variable to the dataset
  library(tidyverse)
  air_safety<-cbind(air_safety,fa_rate) %>%
    mutate(safety = fa_rate<0.2)
  #Check the dimensions of the dataset
  return(air_safety)
}

prepare()

#Add a new variable called "safety", which returns TRUE if the fatal accidents rate
#of the airline is smaller than 0.2, otherwise it returns FALSE
fa <- function(){
  library(tidyverse)    #package for the "mutate" function
  air_safety<-prepare() %>%
    mutate(safety = fa_rate<0.2)
  #Check the dimensions of the dataset
  dim(air_safety)
}

fa()

plot1 <- function(x, y, tipe = 'bar', title) {
  #Data Visualization with plotly
  library(plotly)
  #Barplot representing the number of fatal accidents for each airline in the two periods
  b <- plot_ly(air_safety, x = ~air_safety$airline, y = ~air_safety$fatal_accidents_85_99, type = 'bar', name = '1985-1999') %>%
    add_trace(y = ~air_safety$fatal_accidents_00_14, name = '2000-2014') %>%
    layout(yaxis = list(title = 'Number of Fatal Accidents'), barmode = 'Airline')
  return(b)
}
plot1()

plot2 <- function(){
  data <- prepare()
  p <- plot_ly(data, labels = ~data$safety, type = 'pie') %>%
    layout(title = 'Percentage of safe airlines according to the fatal accidents rate',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  return(p)
}

plot2()

correlation <- function(){
  #Install and load the package corrplot
  library(corrplot)
  #Correlation between the numeric variables in the dataset
  numeric.var<-sapply(air_safety,is.numeric)
  corr.matrix<-cor(air_safety[,numeric.var])
  corrplot(corr.matrix,main="\n\nCorrelation Matrix",method="number")
}
correlation()

reg <- function(){
  #Simple Linear Regression
  reg_1<-lm(air_safety$fatal_accidents_00_14~air_safety$incidents_00_14, data=air_safety)
  summary(reg_1)
  #Multiple Linear Regressions
  reg_2<-lm(air_safety$fatal_accidents_00_14~air_safety$incidents_00_14+air_safety$fatalities_00_14, data=air_safety)
  summary(reg_2)
  result<-list(summary(reg_1), summary(reg_2))
  return(result)
  #Choose regression 2
}
reg()

nFInc<- function(airline) {
  tab <- aggregate( fatal_accidents_00_14 ~ airline, data=prepare(), FUN=sum)
  return(tab[airline,2])
}
