#' Generates Plots that include dates in the x axis
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn
#' @import dplyr
#' @export
#' @return Plot of data changing over time
#' @examples
#' testApiCountLabs(All_Tests)
#' testApiSubset(lab_file="quest", test_type="pcr") %>% testApiCountLabs()
#'
#'
testApiCountLabs<-function(data_frame=All_Tests)
{
return(dplyr::count(data_frame, orderedByEntity.name, processedByEntity.name)  )
}
