# Airlinesafety Package

This package provides the airline safety dataset. The aim of the functions contained in the package is to analyze the safety of these major airlines through the number of total incidents and fatal accidents they experienced from 1985 to 2014.

## Installation

```R
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/f0e7a855')
```

## Dataset

The airline safety dataset is made up of 56 observations, representing airlines, and 8 variables, such as the number of incidents, fatal accidents and fatalities each airline experienced in the periods 1985-1999 and 2000-2014.

Source: https://github.com/fivethirtyeight/data/tree/master/airline-safety

See the dataset documentation for further information

```R
# dataset documentation
?air_safety
```

## Usage

```R
# load the package
library(airlinesafety)
```

### Prepare

The function `prepare()` creates a new variable called "Fatal accidents rate", given by the total number of fatal accidents in 2000-2014 over the total number of incidents in 2000-2014. 
It also creates a new variable called "safety", which has value 'TRUE' if the fatal accidents rate of the airline is smaller than 0.2, otherwise it has value 'FALSE'.
Then it adds the new variables to the dataset and returns as the output the updated dataset.

```R
prepare()
```

### nFInc

The function `nFInc()` requires as the input the number associated to one airline (from 1 to 56) and returns as the output the number of fatal accidents experienced by that airline between 2000 and 2014. 
For instance, in order to know the number of fatal accidents experienced by Alitalia from 2000 to 2014, we can just type the following:

```R
nFInc(10)
```

### Plot 1

The function `plot1()` creates a barplot representing the number of fatal accidents for each airline in the two periods: 1985-1999 and 2000-2014.

```R
plot1()
```

### Plot 2

The function `plot2()` creates a pie chart representing the precentual frequency of safe airlines, according to the fatal accidents rate. 

```R
plot2()
```

Note that the null observations come from 0/0 fatal accidents rate, so the safe airlines are actually the 67.9% of the total airlines.

### Correlation

The function `correlation()`analyses the correlation between the numeric variables in the dataset and returns the correlation plot based on the correlation matrix.

```R
correlation(air_safety)
```

### Reg

The function `reg()` runs two linear regression models: the first one is a simple linear regression of the number of fatal accidents between 2000 and 2014 on the number of incidents between 2000 and 2014; the second one is a multiple linear regression of the number of fatal accidents between 2000 and 2014 on the number of incidents between 2000 and 2014 and the number of fatalities between 2000 and 2014.
As a result, it returns the summary of the two models.

```R
reg(air_safety)
```

The correlation plot obtained with the previous function is actually useful for the multiple linear regression: indeed, we choose the number of incidents between 2000 and 2014 and the number of fatalities between 2000 and 2014 as the independent variables because they are highly correlated to the dependent variable but not correlated to each other, which prevents a situation of multicollinearity. 

Moreover, looking at the regression outputs, we can see that the second model as a larger adjusted R-squared than the first one, and the explanatory variables have both positive and statistically significant coefficients. Thus, we can conclude that the multiple linear regression model should be preferred to the simple one.


