#' Calculates Turnaround time (Tat) for when the sample was reported, when the repost was uploaded and when the sample was uploaded
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with added Tat columns for sample was reported, when the repost was uploaded and when the sample was uploaded
#' @export
#' @examples
#' testApiCalculateTurnaround(All_Test)
#' testApiCalculateTurnaround(sub_Test)

testApiCalculateTurnaround<-function(DataFrame=All_Tests){
  NewFrame=DataFrame
  NewFrame$TatReportSample<-difftime(DataFrame$orderResult.reportedDate,
                                     DataFrame$sampleCollectedDate,
                                     units="days")

  NewFrame$TatUploadReport<-difftime(DataFrame$orderResult.createdAtDate,
                                     DataFrame$orderResult.reportedDate,
                                     units="days")

  NewFrame$TatUploadSample<-difftime(DataFrame$orderResult.createdAtDate,
                                     DataFrame$sampleCollectedDate,
                                     units="days")



  return(NewFrame)
}
