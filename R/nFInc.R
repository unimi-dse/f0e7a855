#' Number of fatal accidents
#'
#' This function requires as the input the number associated to one airline and returns the number of fatal accidents
#' experienced by that airline between 2000 and 2014.
#'
#' This function needs the argument airline.
#'
#' @param airline integer
#'
#' @importFrom stats aggregate
#'
#' @export
#'

nFInc<- function(airline) {
  tab <- aggregate( fatal_accidents_00_14 ~ airline, data=prepare(), FUN=sum)
  return(tab[airline,2])
}
