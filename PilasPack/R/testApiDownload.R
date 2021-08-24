#' Downloads the enteirity of the unique tests API
#'
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @param from Date (upload Date) from where to start downloading data.
#' @param to Date (upload date) to where to download the data (the last date is included)
#' @param format boolian variable. If true, returns the formatted data frame
#' @import httr jsonlite
#' @export
#' @return data frame of all tests starting at date from  and ending at date to of the unique tests API
#' @examples
#' testApiDownloadAll(email, password, from, to)
#' Datos_all=testApiDownloadAll(my_email, my_password,"2021-01-01", "2021-03-15")

testApiDownload<-function(email, password, from, to, format=TRUE){




  base_url="https://bioportal.salud.gov.pr/api/administration/reports/unique-tests"
  Datos_all_list=list()

  dates=helperSliceByMonth(from,to)

  start_of_date=dates[[1]]
  end_of_date=dates[[2]]


  l=length(start_of_date)

  for (i in 1:l){

    #print(Sys.time())

    #produce the url
    url_req=paste("/?","createdAtStartDate=",start_of_date[i],"T00:00:00Z","&","createdAtEndDate=",end_of_date[i],"T23:59:59Z",sep="")
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


  } #ends loop

  Datos_all<-do.call("rbind",Datos_all_list)

  if(format){
    Datos_all=testApiFormat(Datos_all)
  }

  return(Datos_all)

}
