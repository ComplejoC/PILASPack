#' Generates Tables (3) with number of tests by given delay
#'
#' @param data_frame A data frame that has already been manipulated by
#' testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @import dplyr
#' @export
#' @return Three tables with information on the number of tests by difference in time stamps.
#' The first one returns the Turnaround Time (TaT) between the report date and the sample date.
#' The second one returns the Turnaround Time (TaT) between the upload date and the report date.
#' The third one returns the Turnaround Time (TaT) between the upload date and the sample date.
#' @examples
#' testApiCountDelays()
#' testApiSubset(test_type="pcr") %>% testApiCountLabsAndType()[[2]]
#'


testApiCountDelays<-function(DataFrame=All_Tests){
  NewFrame<-testApiCalculateTurnaround(DataFrame)

  T1<-dplyr::count(NewFrame,TatReportSample)
  T2<-dplyr::count(NewFrame, TatUploadReport)
  T3<-dplyr::count(NewFrame, TatUploadSample)

  return( list(T1,T2,T3))
}
