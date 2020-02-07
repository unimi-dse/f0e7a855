#This function creates a new variable called "Fatal accidents rate", given by the number of
#fatal accidents in 2000-2014 over the number of incidents in 2000-2014.
#It also creates a new variable called "safety", which returns TRUE if the fatal accidents rate
#of the airline is smaller than 0.2, otherwise it returns FALSE.
#Then it adds the new variables to the dataset and returns the new dataset.
#Note: this function requires the package tidyverse.

#' @export
#'

prepare <- function() {
  fa_rate<-air_safety$fatal_accidents_00_14/air_safety$incidents_00_14
  air_safety<-cbind(air_safety,fa_rate) %>%
    tidyverse::mutate(safety = fa_rate<0.2)
  return(air_safety)
}
