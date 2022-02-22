#' Downloads the enteirity of the patients API
#'
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @param format boolian variable. If true, returns the formatted data frame
#' @import httr jsonlite
#' @export
#' @return (very large!!) data frame of all tests from unique tests API
#' @examples
#' testApiDownloadAll(email, password)
#' Datos_all=testApiDownloadAll(my_email, my_password)

patientsApiDownloadAll<-function(email, password,format=FALSE){




  base_url="https://bioportal.salud.pr.gov/api/administration/reports/patients/general"
  Datos_all_list=list()

  month_delims=helperMonthDelimiter()

  start_of_month=month_delims[[1]]
  end_of_month=month_delims[[2]]


  l=length(start_of_month)

  for (i in 4:l){

    #print(Sys.time())

    #produce the url
    url_req=paste("/?","createdAtStartDate=",start_of_month[i],"&","createdAtEndDate=",end_of_month[i],sep="")
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

    Datos_all_list[[i]]<-Datos

    names(Datos_all_list)[i]<-names(start_of_month)[i]
  } #ends loop

  Datos_all<-do.call("rbind",Datos_all_list)



  return(Datos_all)

}

