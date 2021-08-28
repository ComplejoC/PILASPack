#' adds error flags for if the dates are out of range
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with date columns transformed in to date objects
#' @import dplyr
#' @export
#' @examples
#' testApiFormat(All_Test)
#' All_Tests=testApiFormat(All_Tests)
