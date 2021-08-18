#' returns a list of dates at most a month apart to use for downloading data
#'
#' @param from A date or string from which to start the sequence
#' @param to A date or string from which to end the sequence
#' @return list with two vectors, starting at from and ending at to, sliced by month
#' @examples
#' helperSliceByMonth("2021-01-15","2021-01-26")
#' helperSliceByMonth("2021-01-15","2021-02-27")
#'



helperSliceByMonth<-function(from,to)
{
  date_from=as.Date(from)
  date_to=as.Date(to)

  if(date_to>date_from+30)
  {
    dates=seq(date_from, date_to, by="months")
    dates2=dates
    for(i in 1:length(dates)-1){
      dates2[i]=dates[i+1]-1
    }
    dates2[length(dates)]=date_to
    return(list(dates,dates2))

  } else{
    return(list(c(date_from),c(date_to)))
  }

}

helperSliceByMonth("2021-01-15","2021-01-26")
helperSliceByMonth("2021-01-15","2021-02-27")
