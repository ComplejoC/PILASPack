#' returns the first day of the month for a given date
#'
#' @param date A date or string to be interpreted as.Date()
#' @return First day of that date's month
#' @examples
#' helperFirstDayOfMonth
#' helperFirstDayOfmonth("2021-01-13")


helperFirstDayOfMonth<-function(date=Sys.Date()){
  if(typeof(date)=="character"){
    day=as.Date(date)
  } else{
    day=date
  }

  return( as.Date(day)-as.numeric(format(day, "%d"))+1  )
}
