#' Barplot
#'
#' This function creates a barplot representing the number of fatal accidents for each airline in the two periods:
#' 1985-1999 and 2000-2014.
#' Note: this function requires the package plotly.
#'
#' This function needs the argument air_safety
#'
#' @param x factor
#' @param y integer
#' @param type character
#'
#' @return barplot
#'
#' @importFrom graphics layout
#' @importFrom magrittr %>%
#'
#' @export
#'

plot1 <- function(x, y, type = 'bar') {
  data <- prepare()
  b <- plotly::plot_ly(data, x = ~data$airline, y = ~data$fatal_accidents_85_99, type = 'bar', name = '1985-1999') %>%
    plotly::add_trace(y = ~data$fatal_accidents_00_14, name = '2000-2014') %>%
    plotly::layout(yaxis = list(title = 'Number of Fatal Accidents'), barmode = 'Airline')
  return(b)
}
