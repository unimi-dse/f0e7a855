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
?airlinesafety
```

## Usage

```R
# load the package
library(airlinesafety)
```

### Prepare

The function `prepare()` creates a new variable called "Fatal accidents rate", given by the total number of fatal accidents in 2000-2014 over the total number of incidents in 2000-2014. 
It also creates a new variable called "safety", which has value 'TRUE' if the fatal accidents rate of the airline is smaller than 0.2, otherwise it has value 'FALSE'.
Then it adds the new variables to the dataset and returns as output the updated dataset.



### Fibonacci

The function `fibonacci()` is implemented in C++ and computes the Fibonacci Sequence.

```R
fibonacci(15)
```

### Shiny App

The function `sampleGUI()` runs a Graphical User Interface to evaluate the projects from https://github.com/unimi-dse 

```R
sampleGUI()
```

