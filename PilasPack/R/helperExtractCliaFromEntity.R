#' extracts the clia
#'
#' @param  labEntity a list of identifiers for a given row of the entityApi data frame
#' @return the string stored under clia, if any. If no clia is found it returns the empty string
#' @examples
#'


helperExtractCliaFromEntity<-function(labEntity)
{
  clia=ifelse(any(labEntity$category=="clia"), (labEntity)$value[which(labEntity$category=="clia")], "")
  return(clia)
}
