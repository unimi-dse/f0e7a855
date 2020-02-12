#' Correlation Plot
#'
#' This function analyses the correlation between the numeric variables in the dataset and returns the correlation plot
#' based on the correlation matrix.
#' Note: this function requires the package corrplot.
#'
#' This function needs the argument air_safety
#'
#' @importFrom stats cor
#'
#' @export
#'

correlation <- function(){
  numeric.var<-sapply(airlinesafety::air_safety, is.numeric)
  corr.matrix<-cor(airlinesafety::air_safety[,numeric.var])
  corrplot::corrplot(corr.matrix,main="\n\nCorrelation Matrix",method="number")
}
