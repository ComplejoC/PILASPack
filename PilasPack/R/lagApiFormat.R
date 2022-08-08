#' Formats the lag api data frame to have date objects, turnaround times, adds the lab tags, etc.
#'
#' @param LagDataFrame A Data Frame object from Test API
#' @return The same Data Frame with date columns transformed in to date objects
#' @import dplyr
#' @export

lagApiFormat<-function(LagDataFrame)
{
  return(LagDataFrame%>% lagApiToDates() %>% lagApiCalculateTurnaround() %>% lagApiAddLIS() %>% lagApiBizDelay()  )
}
