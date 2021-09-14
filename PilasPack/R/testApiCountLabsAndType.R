#' Generates Plots that include dates in the x axis
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn
#' @import dplyr
#' @export
#' @return Plot of data changing over time
#' @examples
#' testApiCountLabsAndType(All_Tests)
#' testApiSubset(lab_tag="quest", test_type="pcr") %>% testApiCountLabsAndType()
#'
#'
testApiCountLabsAndType<-function(data_frame=All_Tests){
  return(dplyr::count(data_frame, orderedByEntity.name, processedByEntity.name,
                      testType, orderResult.result, isElectronic )  )
}
