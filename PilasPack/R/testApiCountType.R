#' Generates Table with number of tests by type, result and upload method
#'
#' @param data_frame A data frame that has already been manipulated by
#' testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @import dplyr
#' @export
#' @return A table with information on the number of tests by type, result and upload method
#' @examples
#' testApiCountType
#' testApiSubset(test_type="pcr") %>% testApiCountType()
#'



testApiCountType<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame,testType, orderResult.result, isElectronic)   )
}
