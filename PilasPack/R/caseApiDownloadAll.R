#' Downloads the enteirity of the unique case API
#'
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @import httr jsonlite
#' @export
#' @return (very large!!) data frame of all cases from case API
#' @examples
#' caseApiDownloadAll(email, password)
#' Datos_all=caseApiDownloadAll(my_email, my_password)

caseApiDownloadAll<-function(email, password){




  base_url="https://bioportal.salud.gov.pr/api/administration/reports/cases"
  Datos_all_list=list()

  month_delims=helperMonthDelimiter()

  start_of_month=month_delims[[1]]
  end_of_month=month_delims[[2]]


  l=length(start_of_month)

  for (i in 3:l){

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

    if(is.data.frame(datos))
    {
      ## Copias de base de datos ##
      Datos<-flatten(datos)
    }

    #store the data in a list

    Datos_all_list[[i]]<-Datos

    names(Datos_all_list)[i]<-names(start_of_month)[i]
  } #ends loop

  Datos_all<-do.call("rbind",Datos_all_list)



  return(Datos_all)

}

