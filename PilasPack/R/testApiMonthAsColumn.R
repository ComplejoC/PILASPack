#' Adds Columns Stating the months the test where Sampled, Reposted and Uploaded to Bioportal
#'
#' @param DataFrame A Data Frame object from Test API
#' @return NewFrame Contains only positive test
#' @examples
#' testApiMonthAsColumn(PCR_Test)
#' testApiMonthAsColumn(ByLab_Test)
#'
testApiMonthAsColumn<-function(DataFrame){
  NewFrame<-DataFrame

  NewFrame$SampleMonth<-format(as.Date(NewFrame$sampleCollectedDate),"%B")
  NewFrame$ReportMonth<-format(as.Date(NewFrame$orderResult.reportedDate), "%B")
  NewFrame$UploadMonth<-format(as.Date(NewFrame$orderResult.createdAtDate),"%B")

  return(NewFrame)
}
