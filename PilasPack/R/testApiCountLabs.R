#' Generates Table with number of tests by ordering entity and processing entity (i.e. by lab)
#'
#' @param data_frame A data frame that has already been manipulated by
#' testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @import dplyr
#' @export
#' @return A table with information on the number of tests by lab
#' @examples
#' testApiCountLabs
#' testApiSubset(test_type="pcr") %>% testApiCountLabs()
#'

testApiCountLabs<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame, orderedByEntity.name, processedByEntity.name)  )
}
