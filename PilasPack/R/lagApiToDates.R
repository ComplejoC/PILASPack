#' Manipulates Dates in to Date Objects
#'
#' @param DataFrame A Data Frame object from lag API
#' @return The same Data Frame with date columns transformed into R Date objects (%Y-%m-%d)
#' @examples
#' All_Tests=lagApiToDates(All_Test)


lagApiToDates<-function(DataFrame){
  NewFrame=DataFrame
  NewFrame$timestamps.sampleCollectedDate<-as.Date(NewFrame$timestamps.sampleCollectedDate)
  NewFrame$timestamps.resultReportedDate<-as.Date(NewFrame$timestamps.resultReportedDate)
  NewFrame$timestamps.createdAt<-as.Date(NewFrame$timestamps.createdAt)
  NewFrame$timestamps.resultCreatedAtDate<-as.Date(NewFrame$timestamps.resultCreatedAtDate)
  NewFrame$patient.birthDate<-as.Date(NewFrame$patient.birthDate)

  #NewFrame$timestamps.uploadDate= (function(x)  ifelse(x==as.Date("0001-01-01"),NA,x) )(NewFrame$timestamps.uploadDate)

  return(NewFrame)
}

