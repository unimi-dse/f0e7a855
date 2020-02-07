#This function analyses the correlation between the numeric variables in the dataset and returns the correlation plot
#based on the correlation matrix.
#Note: this function requires the package corrplot.


correlation <- function(){
  library(corrplot)
  numeric.var<-sapply(air_safety,is.numeric)
  corr.matrix<-cor(air_safety[,numeric.var])
  corrplot(corr.matrix,main="\n\nCorrelation Matrix",method="number")
}
