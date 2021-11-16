#' Downloads the case API from Bioportal on the selected date range
#'
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @param format boolian variable. If true, returns the formatted data frame
#' @import httr jsonlite
#' @export
#' @return data frame of all tests starting at date from  and ending at date to of the unique tests API
#' @examples
#' testApiDownloadAll(email, password)
#' Datos_all=addressApiDownloadAll(my_email, my_password)
#' ---format defaults to FALSE, as format function not yet implemented for cases ---
addressApiDownload<-function(email, password, format=FALSE){




  base_url="https://bioportal.salud.gov.pr/api/administration/reports/patients/addresses"


    #produce the url
    #url_req=paste("/?","createdAtStartDate=",start_of_date[i],"T00:00:00Z","&","createdAtEndDate=",end_of_date[i],"T23:59:59Z",sep="")
    url_req=""
    url=paste(base_url,url_req,sep="")



    data <- list(
      email=email,
      password = password,
      reCaptchaResponseToken="N/A")

    res = POST("https://bioportal.salud.gov.pr/api/authentication/login/",
               body= data, encode='json', content_type('application/json'))

    token = fromJSON(rawToChar(res$content))

    datos = GET(url,
                content_type('application/json'), add_headers(authorization = paste('Bearer', token$token), 'Accept-Enconding'="br"))

    datos = fromJSON(rawToChar(datos$content))

    ## Copias de base de datos ##
    Datos<-flatten(datos)

    #store the data in a list



  if(format){
    Datos_all=testApiFormat(Datos_all)
  }

  return(Datos)

}
