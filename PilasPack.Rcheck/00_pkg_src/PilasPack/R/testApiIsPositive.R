#' Extracts Positive test
#'
#' @param DataFrame A Data Frame object from Test API
#' @return NewFrame Contains only positive test
#' @examples
#' testApiIsPositive(PCR_Test)
#' testApiIsPositive(ByLab_Test)

testApiIsPositive<-function(DataFrame){
  NewFrame=DataFrame
  NewFrame$isPositive<-as.character(grepl("positive",tolower(DataFrame$orderResult.result)))



  return(NewFrame)
}
