#' Formats the test api data frame to have date objects, turnaround times, adds the lab tags, etc.
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with date columns transformed in to date objects
#' @import dplyr
#' @export
#' @examples
#' testApiFormat(All_Test)
#' All_Tests=testApiFormat(All_Tests)

testApiFormat<-function(dataFrame)
{
  return(dataFrame%>% testApiToDates()%>%  testApiMonthAsColumn()%>% testApiCalculateTurnaround() %>%  testApiAddLabTag())
}
