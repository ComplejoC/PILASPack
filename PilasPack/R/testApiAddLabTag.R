#' Adds a Column with the Lab Tags
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with an added Column containg the corresponding Lab Tags for each test
#' @export
#' @examples
#' testApiCalculateTurnaround(All_Test)
#' testApiCalculateTurnaround(sub_Test)

testApiAddLabTag<-function(DataFrame=All_Tests){
  NewFrame=DataFrame
  LabTags=PilasPack::LabTags


  v<-match(NewFrame$processedByEntity.name,  LabTags$Nombre)
  vv<-LabTags$Tag[v]
  vvv<-ifelse(is.na(vv),"Other",vv)
  NewFrame$LabTag=vvv




  return(NewFrame)
}








