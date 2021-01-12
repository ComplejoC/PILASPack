#' Subsets DataFrame by any of the available parameters in TestApi Table
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @param sample_date_start Default is set at as.Date("2020-03-01"). It's the date you want to start subsetting sample dates
#' @param sample_date_end Default is set at as.Date(Sys.Date()). It's the date you want to stop subsetting sample dates
#' @param report_date_start Default is set at as.Date("2020-03-01"). It's the date you want to start subsetting report dates
#' @param report_date_end Default is set at as.Date(Sys.Date()). It's the date you want to stop subsetting report dates
#' @param upload_date_start Default is set at as.Date("2020-03-01"). It's the date you want to start subsetting upload dates
#' @param upload_date_end Default is set at as.Date(Sys.Date()). It's the date you want to stop subsetting upload dates
#' @param test_type Default subsets by all types of test. Takes String value. Available test types are: Molecular, Serological, Antigens,Total Antibodies,Serological IgG Only
#' @param result_type Default subsets by all types of results. Takes String value. Available result types are:Negative, Not Detected, Inconclusive,Positive 2019-nCoV, Positive, Not Tested,Other,Positive IgM Only,Positive IgM and IgG,Positive IgG Only, Not Valid,Invalid, COVID-19 Negative, Presumptive Positive,"", COVID-19 Positive, SARS-CoV-2 Negative, SARS-CoV-2 Presumptive Positive,SARS-CoV-2 Positive
#' @param lab_file="all"
#' @param lab_names=c("all")
#' @param lab_ids=c("all")
#' @param upload_method="all"
#' @param phone_numbers=c("all")
#' @param contact_type="all"
#' @return NewFrame subseted Data Frame by the parameters specified
#' @export
#' @examples
#' testApiSubset(PCR_Test)
#' testApiSubset(ByLab_Test)
#'


testApiSubset<-function(data_frame=All_Tests,
                        sample_date_start=as.Date("2020-03-01"),sample_date_end=as.Date(Sys.Date()),
                        report_date_start=as.Date("2020-03-01"),report_date_end=as.Date(Sys.Date()),
                        upload_date_start=as.Date("2020-03-01"),upload_date_end=as.Date(Sys.Date()),
                        test_type="all", result_type="all",
                        lab_file="all", lab_names=c("all"), lab_ids=c("all"),
                        upload_method="all", phone_numbers=c("all"), contact_type="all" ){
  ###############################################
  #date ranges

  bool_sample_range<-((data_frame$sampleCollectedDate >= sample_date_start) & (data_frame$sampleCollectedDate <= sample_date_end) )

  bool_report_range<-((data_frame$orderResult.reportedDate >= report_date_start) & (data_frame$orderResult.reportedDate <= report_date_end) )


  bool_upload_range<-((data_frame$orderResult.createdAtDate >= upload_date_start) & (data_frame$orderResult.createdAtDate <= upload_date_end) )





  ################################
  #test Type ; default is all (no restrictions)

  if (test_type=="all"){
    bool_test_type=TRUE
  }else if (test_type=="pcr"){
    bool_test_type<-data_frame$testType=="Molecular"
  } else if (test_type=="sero") {
    bool_test_type<-data_frame$testType=="Serological"
  } else if (test_type=="antigens") {
    bool_test_type<-data_frame$testType=="Antigens"
  }


  ##############################################
  #### lab_file

  if (lab_file=="all"){
    bool_lab_file<-TRUE
  } else{
    # download lab info
    lab_info=read.csv(paste0('/content/drive/My Drive/Lab Info/',lab_file,'_names_ids.csv'))

    bool_lab_file= data_frame$processedByEntity.entityId %in% lab_info$ID
  }



  #############################################
  ### lab names
  if(lab_names==c("all")){
    bool_lab_names=TRUE
  } else {
    bool_lab_names=data_frame$processedByEntity.name %in% lab_names
  }

  #############################################
  ### lab ids
  if(lab_ids==c("all")){
    bool_lab_ids=TRUE
  } else {
    bool_lab_ids=data_frame$processedByEntity.entityId %in% lab_ids
  }


  ###########################################################
  #### result type

  if (result_type=="all"){
    bool_result_type=TRUE
  } else if (result_type=="positive"){
    bool_result_type=(grepl("positive", tolower(data_frame$orderResult.result)))
  } else if (result_type=="negative"){
    bool_result_type=(grepl("negative", tolower(data_frame$orderResult.result)))
  } else if (result_type=="not positive" | result_type=="not_positive"){
    bool_result_type=!(grepl("positive", tolower(data_frame$orderResult.result)))
  }

  ###########################
  ### upload method
  if (upload_method=="all"){
    bool_upload_method=TRUE
  }else if( upload_method=="electronic"){
    bool_upload_method=data_frame$isElectronic=="True"
  }  else if( upload_method=="not electronic"){
    bool_upload_method=!data_frame$isElectronic=="False"
  }


  ############################
  ### phone numbers

  if (phone_numbers==c("all")){
    bool_phone_numbers=TRUE
  } else {
    bool_phone_numbers=data_frame$patient.contact.phoneNumber %in% phone_numbers
  }


  ###################################################
  ### contact type
  if (contact_type=="all"){
    bool_contact_type=TRUE
  } else if (contact_type=="self"){
    bool_contact_type=data_frame$patient.contact.contactType=="Self"
  }

  ###############################################
  bool_combined=(bool_sample_range & bool_report_range & bool_upload_range &
                   bool_test_type & bool_result_type
                 & bool_lab_file  & bool_lab_names & bool_lab_ids
                 & bool_upload_method & bool_phone_numbers)

  return(subset(data_frame, bool_combined))

}



### count fucntions
testApiCountType<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame,testType, orderResult.result, isElectronic)   )
}


testApiCountLabs<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame, orderedByEntity.name, processedByEntity.name)  )
}


testApiCountLabsAndType<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame, orderedByEntity.name, processedByEntity.name,
                      testType, orderResult.result, isElectronic )  )
}


testApiCountDates<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame, sampleCollectedDate, orderResult.reportedDate,
                      orderResult.createdAtDate))
}



testApiCountDelays<-function(DataFrame=All_Tests){
  NewFrame<-testApiCalculateTurnaround(DataFrame)

  T1<-dplyr::count(NewFrame,TatReportSample)
  T2<-dplyr::count(NewFrame, TatUploadReport)
  T3<-dplyr::count(NewFrame, TatUploadSample)

  return( list(T1,T2,T3))
}


### Missing Value Functions

testApiMissingValues<-function(DataFrame){
  Newframe<-data.frame(matrix(data=0, nrow=ncol(DataFrame), ncol=4))
  colnames(Newframe)<-c("Variable","No. Tests with Missig Value",
                        "Total Number of Tests", "Percent (%)")

  Newframe[,1]<-colnames(DataFrame)
  Newframe[,3]<-nrow(DataFrame)

  for(i in 1:nrow(Newframe)){
    Newframe[i,2]<-nrow(subset(DataFrame, DataFrame[,i]=="" | is.na(DataFrame[,i])))
  }
  Newframe[,4]<-Newframe[,2]/Newframe[,3]*100

  return(Newframe)
}





### test volume fucntions
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
