#' Generates Tables for Missing Values
#'
#' @param DataFrame A data frame that has already been manipulated by
#' testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @export
#' @return A table with information on the number and fraction of missing values per variable
#' considered
#' @examples
#' testApiMissingValues
#' testApiSubset(test_type="pcr") %>% testApiMissingValues()
#'


### Missing Value Functions


testApiMissingValues<-function(DataFrame){
  Newframe<-data.frame(matrix(data=0, nrow=ncol(DataFrame), ncol=4))
  colnames(Newframe)<-c("Variable","No. Tests with Missig Value",
                        "Total Number of Tests", "Percent (%)")

  Newframe[,1]<-colnames(DataFrame)
  Newframe[,3]<-nrow(DataFrame)

  for(i in 1:nrow(Newframe)){
    Newframe[i,2]<-nrow(subset(DataFrame, DataFrame[,i]=="" | is.na(DataFrame[,i])))
  }
  Newframe[,4]<-Newframe[,2]/Newframe[,3]*100

  return(Newframe)
}
