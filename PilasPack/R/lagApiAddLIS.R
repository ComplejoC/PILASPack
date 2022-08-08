#' Adds a colummn with the LIS to the 'lag' API DataFrame
#'
#' @param LagDataFrame A Data Frame object from lag API
#' @return DataFrame with an additional colummn containing the LIS to the 'lag' API DataFrame
#' @export

lagApiAddLIS<-function(LagDataFrame){
  #first, create a copy
  DataFrame=LagDataFrame
  #add a new colummn called LIS and initialize it to NA
  DataFrame$LIS<-NA

  #first, if the tests are electronic and have no lis, add "SAIL"
  DataFrame$LIS=ifelse( (DataFrame$laboratory.isElectronic) & (is.na(DataFrame$laboratory.lis)), "SAIL", DataFrame$laboratory.lis )

  return(DataFrame)


}
