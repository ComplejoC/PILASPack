#' Adds a Column with the Lab Tags
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with an added Column containg the corresponding Lab Tags for each test
#' @export
#' @examples
#' testApiCalculateTurnaround(All_Test)
#' testApiCalculateTurnaround(sub_Test)

testApiAddSingleLabHashtag<-function(DataFrame=All_Tests, hashtag){
  NewFrame=DataFrame
  
  #check if the Hashtag colum is already added. If not, do so
  if(!("Hashtag" %in%colnames(NewFrame)) ){
    NewFrame$Hashtag=""
  }
  
  
  v<-which(grepl(tolower(hashtag),tolower(NewFrame$orderedByEntity.name)) |
             grepl(tolower(hashtag),tolower(NewFrame$processedByEntity.name)))
  NewFrame[v,]$Hashtag=paste0(NewFrame[v,]$Hashtag, hashtag, "; ")
  
  
  
  
  return(NewFrame)
}
