#' Returns Positivity for test available in TestApi Table
#'
#' @param DataFrame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @param cutoff_min If True, cuts off to the earliest non-zero date
#' @param cutoff_max If True, cuts off to the latest non-zero date
#' @param cutoff_lower Cuts off at specific lower date
#' @param cutoff_upper Cuts off at specific upper date
#' @export
#' @return NewFrame with the Electronic Transmission Rate (ETR) calculated by date
#' @examples
#' testApiPositivity(PCR_Test)
#' testApiPositivity(ByLab_Test)
#'

testApiETR<-function(DataFrame= All_Tests,
                     cutoff_min=TRUE, cutoff_max=TRUE,
                     cutoff_lower="no", cutoff_upper="no" ){
  fechas<-testApiDateList();


  NewFrame<-data.frame(matrix(data=0,nrow=length(fechas),ncol=5 ) )
  colnames(NewFrame)<-c("Fecha","Sent Electronically","Not Sent Electronically",
                        "Total Uploaded","Electronic Transmission Rate (%)")
  NewFrame[,1]<-fechas
  for(i in 1:nrow(NewFrame)){
    NewFrame[i,2]<-nrow(subset(DataFrame, isElectronic=="True" & orderResult.createdAtDate==fechas[i]  ))
    NewFrame[i,4]<-nrow(subset(DataFrame, orderResult.createdAtDate==fechas[i]))
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
    min_date_index=min(which(!( NewFrame[,4]==0)))
  }

  if(cutoff_max){
    max_date_index=max(which(!( NewFrame[,4]==0)))
  }



  return(NewFrame[c(min_date_index:max_date_index),])




  return(NewFrame)
}
