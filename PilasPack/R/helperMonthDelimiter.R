#' generates two vectors, one with the first day of the month starting from april 2020
#' to the current month, and one with le last day of the month starting from april 2020
#' to the current month
#'
#' @param date A date or string to be interpreted as.Date()
#' @return list with two vectors, one for the start of month and one for the end of month
#' @examples
#'



helperMonthDelimiter<-function(date=Sys.Date()){
  #the first month for the data is April 2020 because the first test registered on Bioportal is from april 2020
  # we'll use this to make a list of the first day of the month starting from this date
  first_month_start="2020-04-01"

  current_month_start=helperFirstDayOfMonth(date)

  seq_start=seq.Date(as.Date(first_month_start),as.Date(current_month_start), by="month")

  start_of_month=paste(seq_start, "T00:00:00Z", sep="")

  seq_end=seq.Date(as.Date(first_month_start), length.out=length(seq_start)+1, by="month")
  seq_end=seq_end[2:length(seq_end)]-1

  end_of_month=paste(seq_end, "T23:59:59Z", sep="")

  names(start_of_month)=format(seq_start, "%B%Y")
  names(end_of_month)=format(seq_end, "%B%Y")


  return(list(start_of_month, end_of_month))

}
