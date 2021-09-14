#' Adds a Column with the Lab Tags
#'
#' @param DataFrame A Data Frame object from Test API
#' @return The same Data Frame with an added Column containg the corresponding Lab Tags for each test
#' @export
#' @examples
#' testApiCalculateTurnaround(All_Test)
#' testApiCalculateTurnaround(sub_Test)

testApiAddLabHashtags<-function(DataFrame=All_Tests, hashtags){
  NewFrame=DataFrame

  for(i in 1:length(hashtags)){
    NewFrame=testApiAddSingleLabHashtag(NewFrame, hashtags[i])
  }
   return(NewFrame)
}
