#' Manipulates Dates in to Date Objects
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with date columns transformed in to date objects
#' @examples
#' testApiToDates(All_Test)
#' testApiToDates(sub_Test)

testApiToDates<-function(DataFrame=All_Tests){
  NewFrame=DataFrame
  NewFrame$sampleCollectedDate<-as.Date(NewFrame$sampleCollectedDate,"%m/%d/%Y")
  NewFrame$orderResult.reportedDate<-as.Date(NewFrame$orderResult.reportedDate,"%m/%d/%Y")
  NewFrame$createdAtDate<-as.Date(NewFrame$createdAtDate,"%m/%d/%Y")
  NewFrame$orderResult.createdAtDate<-as.Date(NewFrame$orderResult.createdAtDate,"%m/%d/%Y")

  return(NewFrame)
}
