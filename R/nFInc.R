#This function requires as the input the number associated to one airline and returns the number of fatal incidents
# experienced by that airline between 2000 and 2014.

#' @export
#'

nFInc<- function(airline) {
  tab <- aggregate( fatal_accidents_00_14 ~ airline, data=prepare(), FUN=sum)
  return(tab[airline,2])
}
