#' Generates Plots that include dates in the x axis
#'
#' @param DataFrame A data frame that has already been manipulated by
#' testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @import dplyr
#' @export
#' @return A  compact table with information on the number and fraction of missing values per variable
#' considered
#' @examples
#' testApiMissingValuesCompact()
#' testApiSubset(test_type="pcr") %>% testApiMissingValuesCompact()
#'

## Missing Values Compact

testApiMissingValuesCompact<-function(DataFrame){

  important_categories_for_missing<-c("patient.firstName", "patient.lastName",
                                      "patient.birthDate", "patient.address.city","patient.contact.phoneNumber",
                                      "testType","orderResult.result","sampleCollectedDate","orderResult.reportedDate")


  return (testApiMissingValues(DataFrame) %>% filter(Variable
                                                     %in% important_categories_for_missing) %>% mutate(Variable=factor(Variable, levels = important_categories_for_missing)) %>% arrange(Variable) )


}
