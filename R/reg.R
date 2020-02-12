#' Linear Regressions
#'
#' This function runs two linear regression models: the first one is a simple linear regression of the number of
#' fatal accidents between 2000 and 2014 on the number of incidents between 2000 and 2014; the second one is a
#' multiple linear regression of the number of fatal accidents between 2000 and 2014 on the number of incidents
#' between 2000 and 2014 and the number of fatalities between 2000 and 2014.
#' As a result, it returns the summary of the two models.
#' This function needs the argument air_safety.
#'
#' @importFrom stats lm
#'
#' @export
#'

reg <- function(){
  #Simple Linear Regression
  reg_1<-lm(airlinesafety::air_safety$fatal_accidents_00_14~airlinesafety::air_safety$incidents_00_14, data=airlinesafety::air_safety)
  summary(reg_1)
  #Multiple Linear Regressions
  reg_2<-lm(airlinesafety::air_safety$fatal_accidents_00_14~airlinesafety::air_safety$incidents_00_14+airlinesafety::air_safety$fatalities_00_14, data=airlinesafety::air_safety)
  summary(reg_2)
  result<-list(summary(reg_1), summary(reg_2))
  return(result)
  #Choose regression 2
}
