#' Generates Table with number of tests by lab and type
#'
#' @param data_frame A data frame that has already been manipulated by
#' testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @import dplyr
#' @export
#' @return A table with information on the number of tests by lab and type
#' @examples
#' testApiCountLabsAndType
#' testApiSubset(test_type="pcr") %>% testApiCountLabsAndType()
#'

testApiCountLabsAndType<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame, orderedByEntity.name, processedByEntity.name,
                      testType, orderResult.result, isElectronic )  )
}
