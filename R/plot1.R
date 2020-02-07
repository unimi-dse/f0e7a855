#' This function creates a barplot representing the number of fatal accidents for each airline in the two periods:
#' 1985-1999 and 2000-2014.
#' Note: this function requires the package plotly.
#'
#' @param x factor
#' @param y integer
#' @param tipe character
#' @param title character
#'
#' @return piechart
#'
#' @export
#'

plot1 <- function(x, y, tipe = 'bar', title) {
  b <- plotly::plot_ly(air_safety, x = ~air_safety$airline, y = ~air_safety$fatal_accidents_85_99, type = 'bar', name = '1985-1999') %>%
    add_trace(y = ~air_safety$fatal_accidents_00_14, name = '2000-2014') %>%
    layout(yaxis = list(title = 'Number of Fatal Accidents'), barmode = 'Airline')
  return(b)
}
