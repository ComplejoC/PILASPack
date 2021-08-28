#' Downloads the enteirity of the School Memebers API
#'
#' @param email Bioportal account email to be used to access unique tests API
#' @param password Bioportal account password to be used to access unique tests API
#' @import httr jsonlite
#' @export
#' @return data frame of the school Members API
#' @examples
#' testApiDownloadAll(email, password)
#' Datos_all=testApiDownloadAll(my_email, my_password)

schoolMemebersApiDownloadAll<-function(email, password){




    base_url="https://bioportal.salud.gov.pr/api/administration/reports/education/school-members"


    #produce the url

    url=base_url



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





  return(Datos)

}
