#' extracts the address as a dataframe
#'
#' @param  caseDataFrame data frame of entities obtained from the entity API
#' @import dplyr
#' @export
#' @return data frame of cases with case ids, number of addresses and info on missing values
#' @examples caseApiAddressDataFrame=caseApiGetAddressDataFrame(caseDataFrame)
#'


caseApiGetAddressDataFrame<-function(caseDataFrame)
{

  #save a list of faulty zip codes:
  faultyZipList=c("0000","-000","000","9999","99999","00000", "NA","<NA>")
  faultyAddressList=c(".", "..", "...", "*", "NA","<NA>")

  #make a new data frame to store the name and clia of the labs
  NewFrame=data.frame(matrix(nrow =nrow(caseDataFrame), ncol = 17))
  colnames(NewFrame)=c("caseId","patientId",
                       "caseStatus","caseType",
                       "numberOfAddresses", "numberOfUniqueAddresses",
                       "numberOfEmptyAddressLine1","numberOfEmptyAddresses","EmptyAddress?",
                       "numberOfEmptyZip4","numberOfEmptyZip5","numberOfEmptyZipCodes","EmptyZipCode?",
                       "numberOfCities","MultipleCities?","MostFrequentCity",
                       "numberOfEmptyCities")

  #Fill with name and Id
  NewFrame$caseId=caseDataFrame$caseId
  NewFrame$patientId=caseDataFrame$patient.patientId

  #And with case status and type
  NewFrame$caseStatus=caseDataFrame$caseStatus
  NewFrame$caseType=caseDataFrame$caseType

  A=caseDataFrame$patient.address
  ADF=lapply(A, data.frame)


  #nAd=lapply(ADF, nrow)
  nAd =lapply(ADF, {function(x) ifelse(length(x)>0, nrow(x), 0)})
  nUAd=lapply(ADF, {function(x) ifelse( length(x)>0,nrow(dplyr::count(x, addressLine1, addressLine2, city, zip4, zip5)),0)})

  #now check for how many of the addresses listed are missiong or the empty string
  # ** TO BE IMPLEMENTED: check how many are "garbage"
  n_empty_1=lapply(ADF, {function(x) ifelse(length(x)>0, sum( (is.na(x$addressLine1) | x$addressLine1=="") | x$addressLine1 %in% faultyAddressList),0) } )
  n_empty_2=lapply(ADF, {function(x) sum( (is.na(x$addressLine2) | x$addressLine2=="") | x$addressLine1 %in% faultyAddressList) } )
  n_empty_all=lapply(ADF, {function(x) sum( (is.na(x$addressLine1) | x$addressLine1==""| x$addressLine1 %in% faultyAddressList) & (is.na(x$addressLine2) | x$addressLine2=="" | x$addressLine1 %in% faultyAddressList) ) })

  n_empty_zip4=lapply(ADF, {function(x) ifelse(length(x)>0,sum( (is.na(x$zip4) | x$zip4=="" | x$zip4 %in% faultyZipList) ) ,0)})
  n_empty_zip5=lapply(ADF, {function(x) ifelse(length(x)>0,sum( (is.na(x$zip5) | x$zip5=="" | x$zip5 %in% faultyZipList) ) ,0)})
  n_empty_zipCode=lapply(ADF, {function(x) ifelse(length(x)>0, sum( (is.na(x$zip5) | x$zip5=="" | x$zip5 %in% faultyZipList) & (is.na(x$zip4) | x$zip4=="" | x$zip4 %in% faultyZipList) ) ,0)})

  n_unique_cities=lapply(ADF, {function(x) ifelse(length(x)>0,nrow(dplyr::count(x, city)) ,0)})
  n_empty_cities=lapply(ADF, {function(x) ifelse(length(x)>0, sum(is.na(x$city) | x$city=="") ,"All")})

  NewFrame$numberOfAddresses=nAd
  NewFrame$numberOfUniqueAddresses=nUAd
  NewFrame$numberOfEmptyAddressLine1=n_empty_1
  NewFrame$numberOfEmptyAddresses=n_empty_all

  NewFrame$numberOfEmptyZip4=n_empty_zip4
  NewFrame$numberOfEmptyZip5=n_empty_zip5
  NewFrame$numberOfEmptyZipCodes=n_empty_zipCode


  NewFrame$numberOfCities=n_unique_cities
  NewFrame$numberOfEmptyCities=n_empty_cities

  NewFrame$MostFrequentCity=lapply(ADF, {function(x) ifelse(length(x)>0,(dplyr::count(x, city, sort=TRUE))[1,]$city ,"No Tienen Municipio")})



  #Finally, make boolean variable to see if we have the requiered info
  NewFrame$'EmptyAddress?'=(unlist(NewFrame$numberOfAddresses)-unlist(NewFrame$numberOfEmptyAddresses))==0
  NewFrame$'EmptyZipCode?'=(unlist(NewFrame$numberOfAddresses)-unlist(NewFrame$numberOfEmptyZipCodes))==0
  NewFrame$'MultipleCities?'=unlist(NewFrame$numberOfCities)>1

  return(NewFrame)
}

