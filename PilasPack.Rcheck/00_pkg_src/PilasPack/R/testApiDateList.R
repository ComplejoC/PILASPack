#' Generates List of Dates
#'
#' @param
#' @return List of Dates
#' @examples
#' testApiDateList()

testApiDateList<-function(){
  f<-seq.Date(as.Date("2020-03-09"),as.Date(Sys.Date()),by="days")
  return(f)
}
