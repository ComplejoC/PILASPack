#' Generates Plots that include dates in the x axis
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn
#' @import dplyr
#' @export
#' @return 3 Table of distrubution of Turnaround times between: (1) Report Date and
#' Sample Date (2) Upload Date and Report Date (3) Upload Date and Sample Date
#' @examples
#' testApiCountDelays(All_Tests)
#' testApiSubset(lab_tag="quest", test_type="pcr") %>% testApiCountDelays()
#'
#'
testApiCountDelays<-function(DataFrame=All_Tests){
  NewFrame<-testApiCalculateTurnaround(DataFrame)

  T1<-dplyr::count(NewFrame,TatReportSample)
  T2<-dplyr::count(NewFrame, TatUploadReport)
  T3<-dplyr::count(NewFrame, TatUploadSample)

  L=list(T1,T2,T3)
  names(L)=c("Delay Between Report Date and Sample Date",
             "Delay Between Upload Date Report Date",
             "Delay Between Upload Date and Sample Date")

  return(L)
}
