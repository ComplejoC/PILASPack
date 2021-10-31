#' Downloads the enteirity of the unique case API
#'
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @import httr jsonlite
#' @export
#' @return  data frame of all entities from entity API
#' @examples
#' entityApiDownloadAll(email, password)
#' Entities=entityApiDownloadAll(my_email, my_password)

entityApiDownloadAll<-function(email, password){
  
  
  
  
    url="https://bioportal.salud.gov.pr/api/administration/reports/entities/general"
  
    
    
    
    
    
    
    data <- list(
      email=email,
      password = password,
      reCaptchaResponseToken="N/A")
    
    res = POST("https://bioportal.salud.gov.pr/api/authentication/login/",
               body= data, encode='json', content_type('application/json'))
    
    token = fromJSON(rawToChar(res$content))
    
    datos = GET(url,
                content_type('application/json'), add_headers(authorization = paste('Bearer', token$token)))
    
    datos = fromJSON(rawToChar(datos$content))
    
    if(is.data.frame(datos))
    {
      ## Copias de base de datos ##
      Datos<-flatten(datos)
    }
    
    
    
  
  
  return(Datos)
  
}
