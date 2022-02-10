#' Downloads the unique tests API from Bioportal for the selected date ranges
#'
#' @param api API to be used (can be test, case, address, entity, schoolMembers, lag)
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @param from Date (upload Date) from where to start downloading data.
#' @param to Date (upload date) to where to download the data (the last date is included)
#' @param format boolian variable. If true, returns the formatted data frame
#' @import httr jsonlite
#' @export
#' @return data frame from specified API
#' @examples
#' testApiDownloadAll(email, password, from, to)
#' Datos_all=testApiDownloadAll(my_email, my_password,"2021-01-01", "2021-03-15")

Download<-function(api, email, password, from, to, format=FALSE)
  {
  cat("Prints the url of the selected API *WIP*")
  case=tolower(api)
  Datos=switch(case,
               "test"=testApiDownload(email, password, from, to, format),
               "tests"=testApiDownload(email, password, from, to, format),
               "case"=caseApiDownload(email,password,from,to,format),
               "cases"=caseApiDownload(email,password,from,to,format),
               "address"=addressApiDownload(email,password),
               "entity"=entityApiDownloadAll(email,password),
               "schoolmember"=schoolMembersApiDownloadAll(email,password),
               "schoolmembers"=schoolMembersApiDownloadAll(email,password),
               "lag"=lagApiDownload(email,password,from, to, format),
               "patients"=patientsApiDownloadAll(email, password),
               "interviews"=interviewsApiDownload(email, password, from, to),
               cat("Invalid API entred. Please use one of the following: test  case  address  entity  schoolMember lag")
               )
  return(Datos)
  }
