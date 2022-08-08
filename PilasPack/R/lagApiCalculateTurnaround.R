#' Calculates Turnaround time (Tat) for when the sample was reported, when the repost was uploaded and when the sample was uploaded
#'
#' @param DataFrame A Data Frame object from lag API
#' @return The same Data Frame with added Tat columns for sample was reported, when the repost was uploaded and when the sample was uploaded
#' @export
#' @examples
#' lagApiCalculateTurnaround(All_Test)

lagApiCalculateTurnaround<-function(DataFrame){
  NewFrame=DataFrame
  NewFrame$TatReportSample<-difftime(DataFrame$timestamps.resultReportedDate,
                                     DataFrame$timestamps.sampleCollectedDate,
                                     units="days")

  NewFrame$TatUploadReport<-difftime(DataFrame$timestamps.resultCreatedAtDate,
                                     DataFrame$timestamps.resultReportedDate,
                                     units="days")

  NewFrame$TatUploadSample<-difftime(DataFrame$timestamps.resultCreatedAtDate,
                                     DataFrame$timestamps.sampleCollectedDate,
                                     units="days")

  NewFrame$TatFileUploadToResultCreated <-floor(difftime(DataFrame$timestamps.resultCreatedAtDate,
                                                         DataFrame$timestamps.fileUploadDate,
                                                         units="days"))

  NewFrame$TatResultReportedToFileUpload <-floor(difftime(DataFrame$timestamps.fileUploadDate,
                                                          DataFrame$timestamps.resultReportedDate,
                                                          units="days"))



  return(NewFrame)
}
