#' Generates Plots that include dates in the x axis
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @param cutoff_lower a date from which to cut off the lower part of the data frame.
#' displays tests only from cutoff lower onward (as.Date(), defaults to string "no")
#' @param cutoff_upper a date from which to cut off the upper part of the data frame.
#' displays tests only from cutoff lower and earlier (as.Date(), defaults to string "no")
#' @param cutoff_min a boolean value. If TRUE, shows the data frame from the earliest non-zero date onward
#' defaults to FALSE
#' @param cutoff_max a boolean value. If TRUE, shows the data frame up to the latest non-zero date onward
#' defaults to FALSE
#'
#' @export
#' @return Plot of data changing over time
#' @examples
#' testApiTestVolume()
#' testApiSubset(lab_file="quest", test_type="pcr") %>% testApiTestVolume()
#'



testApiTestVolume<-function(data_frame=All_Tests,
                            cutoff_lower="no", cutoff_upper="no",
                            cutoff_min=FALSE, cutoff_max=FALSE){
  fechas<-testApiDateList();
  NewFrame<-data.frame(matrix(data=0,nrow=length(fechas),ncol=4 ) )
  colnames(NewFrame)<-c("Fecha","Sampled","Reported","Uploaded")
  NewFrame[,1]<-fechas

  for(i in 1:nrow(NewFrame)){
    NewFrame[i,2]<-nrow(subset(data_frame, sampleCollectedDate==fechas[i]))
    NewFrame[i,3]<-nrow(subset(data_frame, orderResult.reportedDate==fechas[i]))
    NewFrame[i,4]<-nrow(subset(data_frame, orderResult.createdAtDate==fechas[i]))
  }

  if(cutoff_lower!="no"){
    min_date_index=which(NewFrame[,1]==cutoff_lower)
  } else{
    min_date_index=1
  }

  if(cutoff_upper!="no"){
    max_date_index=which(NewFrame[,1]==cutoff_upper)
  } else{
    max_date_index=length(fechas)
  }

  if(cutoff_min){
    min_date_index=min(which(!(NewFrame$Sampled==0 & NewFrame$Reported==0 & NewFrame$Uploaded==0)))
  }

  if(cutoff_max){
    max_date_index=max(which(!(NewFrame$Sampled==0 & NewFrame$Reported==0 & NewFrame$Uploaded==0)))
  }



  return(NewFrame[c(min_date_index:max_date_index),])
}
