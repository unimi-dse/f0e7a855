#' This function runs two linear regression models:
#' - the first one is a simple linear regression of fatal_accidents_00_14 on incidents_00_14
#' - the second one is a multiple linear regression of fatal_accidents_00_14 on incidents_00_14 and fatalities_00_14.
#' As a result, it returns the summary of the two models.

#' @export
#'

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
