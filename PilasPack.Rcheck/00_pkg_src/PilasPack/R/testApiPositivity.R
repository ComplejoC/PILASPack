#' Returns Positivity for test available in TestApi Table
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @param cutoff_min=FALSE
#' @param cutoff_max=FALSE
#' @param cutoff_lower="no"
#' @param cutoff_upper="no"
#' @export
#' @return NewFrame with the positivity calculated by unit of time
#' @examples
#' testApiPositivity(PCR_Test)
#' testApiPositivity(ByLab_Test)
#'

testApiPositivity<-function(DataFrame= All_Tests,
                            cutoff_min=FALSE, cutoff_max=FALSE,
                            cutoff_lower="no", cutoff_upper="no"){
  fechas<-testApiDateList();

  NewFrame<-data.frame(matrix(data=0,nrow=length(fechas),ncol=5 ) )
  colnames(NewFrame)<-c("Fecha","Positives","Not Positives", "Total Reported","Positivity (%)")
  NewFrame[,1]<-fechas
  for(i in 1:nrow(NewFrame)){
    NewFrame[i,2]<-nrow(subset(DataFrame, orderResult.reportedDate==fechas[i] &
                                 grepl("positive",tolower(orderResult.result))  ))
    NewFrame[i,4]<-nrow(subset(DataFrame, orderResult.reportedDate==fechas[i]))
  }

  NewFrame[,3]<-NewFrame[,4]-NewFrame[,2]

  NewFrame[,5]<-NewFrame[,2]/NewFrame[,4]*100

  #convert NAs to 0
  NewFrame[,5]<-ifelse(NewFrame[,4]==0, 0, NewFrame[,5])

  #cutoffs


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
    min_date_index=min(which(!( NewFrame$`Total Reported`==0)))
  }

  if(cutoff_max){
    max_date_index=max(which(!( NewFrame$`Total Reported`==0)))
  }



  return(NewFrame[c(min_date_index:max_date_index),])




  return(NewFrame)
}
