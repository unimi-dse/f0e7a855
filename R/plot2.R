#' Pie Chart
#'
#' This function creates a pie chart representing the precentual frequency of safe airlines, according to
#' the fatal accidents rate: note that the null observations come from 0/0 fatal accidents rate, so the safe airlines
#' are actually the 67.9% of the toal airlines.
#' Note: this function requires the prepare function.
#'
#' @importFrom magrittr %>%
#' @importFrom graphics layout
#'
#' @export
#'

plot2 <- function(){
  data <- prepare()
  p <- plotly::plot_ly(data, labels = ~data$safety, type = 'pie') %>%
    plotly::layout(title = 'Percentage of safe airlines according to the fatal accidents rate',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  return(p)
}
