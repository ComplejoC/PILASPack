#' calculates the delays between file upload and created, considering the number of buisness days
#'
#' @param LagDataFrame A Data Frame object from lag API
#' @import bizdays
#' @return DataFrame with an additional colummn containing the delays between file upload and created, considering the number of buisness days
#' @export

lagApiBizDelay<-function(LagDataFrame){

  #first, create a copy
  DataFrame=LagDataFrame

  #create a calendar containing the weekends
  weekends_calendar<-bizdays::create.calendar("my_calendar",weekdays = c('saturday','sunday'))

  #calculate the delay between resultReportedDate and resultCreatedAtDate using this calendar
  DataFrame$bizDelay=bizdays(DataFrame$timestamps.resultReportedDate,
                           DataFrame$timestamps.resultCreatedAtDate, cal = weekends_calendar)

  #calculate the delay between resultCreatedAtDate and fileUploadDate using this calendar
  DataFrame$bizDelayFileUp=bizdays(DataFrame$timestamps.fileUploadDate,
                                 DataFrame$timestamps.resultCreatedAtDate, cal = weekends_calendar)

  return(DataFrame)


}
