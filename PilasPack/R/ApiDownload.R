#' Downloads the unique tests API from Bioportal for the selected date ranges
#'
#' @param email Bioportal account email to be used to acces unique tests API
#' @param password Bioportal account password to be used to acces unique tests API
#' @param from Date (upload Date) from where to start downloading data.
#' @param to Date (upload date) to where to download the data (the last date is included)
#' @param api API to download
#' @param timezone timezone to use (defaults to "UTC")
#' @param PR_Timezone Boolean. If True, will set the timezone to "Etc/GMT+4"
#' @import httr jsonlite lubridate
#' @export
#' @return data frame of all tests starting at date from  and ending at date to of the unique tests API
#' @examples
#' testApiDownloadAll(email, password, from, to)
#' Datos_all=testApiDownloadAll(my_email, my_password,"2021-01-01", "2021-03-15")

ApiDownload<-function(email, password, from, to, api, timezone="UTC", PR_Timezone=FALSE){

  ##############################
  # Getting Token
  data <- list(
    email=email,
    password = password,
    reCaptchaResponseToken="N/A")

  res = POST("https://bioportal.salud.gov.pr/api/authentication/login/",
             body= data, encode='json', content_type('application/json'))

  token = fromJSON(rawToChar(res$content))

  ##############################

  #function to get the data
  get_data<-function(url)
  {
    api_data=GET(url,content_type('application/json'), add_headers(authorization = paste('Bearer', token$token), 'Accept-Enconding'="br"))

    api_data_frame=flatten(fromJSON(rawToChar(api_data$content)))

    return(api_data_frame)
  }

  ############################

  #get the index in the endpoint table
  i=which(PilasPack::Endpoints$Name==api)

  #now, get the url and weight
  api_url=PilasPack::Endpoints$URL[i]
  w=(PilasPack::Endpoints$Weight[i])
  if(w=="heavy"){

    #create the sequence of dates
    dates=seq.Date(as.Date(from), as.Date(to), by="days")

    #now, add 00:00:00 for the beggining url header
    dates_0=paste(dates, "00:00:00")
    #set to desired timezone
    start_dates=ymd_hms(dates_0, tz=timezone)
    #display in UTC
    start_times=with_tz(start_dates, tz="UTC")
    #format it for api call
    start_timestamps=format(start_times, '%Y-%m-%dT%H:%M:%SZ')


    #now add 23:59:59
    dates_midnight=paste(dates, "23:59:59")
    #set to desired timezone
    end_dates=ymd_hms(dates_midnight, tz=timezone)
    #display in UTC
    end_times=with_tz(end_dates, tz="UTC")
    #format it for api call
    end_timestamps=format(end_times, '%Y-%m-%dT%H:%M:%SZ')

    #finally, this the list of urls to use
    url_header=paste("/?","createdAtStartDate=",start_timestamps,"&","createdAtEndDate=",end_timestamps ,sep="")

    url=paste(api_url, url_header, sep="")

  } else{
    url=api_url
  }


  #############################
  X=lapply(url, get_data)


  API_Data_Frame=do.call("rbind",X)

  return(API_Data_Frame)

  #############################

  #TO-DO: implement format
  # Print Times


}
