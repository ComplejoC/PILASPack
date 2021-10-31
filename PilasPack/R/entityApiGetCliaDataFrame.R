#' extracts the clia
#'
#' @param  entityDataFrame data frame of entities obtained from the entity API
#' @export
#' @return data frame of laboratories with entityId, name and clia
#' @examples labsWithClia=entityApiGetCliaDataFrame(entityDataFrame)
#'


entityApiGetCliaDataFrame<-function(entityDataFrame)
{
  #First, get the subset of labs
  labDataFrame=subset(entityDataFrame, entityType=="Laboratory")

  #make a new data frame to store the name and clia of the labs
  NewFrame=data.frame(matrix(nrow =nrow(labDataFrame), ncol = 3 ))
  colnames(NewFrame)=c("entityId","name","clia")

  #Fill with name and Id
  NewFrame$name=labDataFrame$name
  NewFrame$entityId=labDataFrame$entityId

  EE=labDataFrame$identifiers
  EDF=lapply(EE, data.frame)
  EE_CLIA=lapply(EDF, helperExtractCliaFromEntity)

  NewFrame$clia=unlist(EE_CLIA, use.names = FALSE)

  return(NewFrame)
}
