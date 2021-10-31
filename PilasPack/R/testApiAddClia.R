#' Adds two columns with the clia  for orderedByEntity and processedByEntity
#'
#' @param testDataFrame A Data Frame object from Test API
#' @param cliaDataFrame A Data Frame from the entity API (if none is found, it downloads it)
#' @param email email used to download the entities dataframe (if needed)
#' @param password password used to download the entities dataframe (if needed)
#' @import tibble
#' @export
#' @return The same Data Frame with an added Column containg the corresponding Lab Tags for each test
#' @examples
#' testApiAddLabClias
#' testApiAddLabClias(sub_Test)

testApiAddLabClia<-function(testDataFrame,cliaDataFrame=NULL, email="my_email", password="my_password"){
  
  #first, get the EntityDataFrame if needed
  if(is.null(cliaDataFrame))
  {
    cat("No clia data frame was given. Proceeding to download using provided credentials")
    proceedToDownload=TRUE
    #check if an email was entered
    if(email=="my_email")
    {
      cat("No clia data frame was given. Please provide an email to attempt download")
      proceedToDownload=FALSE
    }
    
    #check if a password was entered
    if(password=="my_password")
    {
      cat("No clia data frame was given. Please provide a password to attempt download")
      proceedToDownload=FALSE
    }
    
    #if email and password was provided, download the entity api
    if(proceedToDownload)
    {
      entityDF=entityApiDownloadAll(email = email, password = password)
      cliaDF=entityApiGetCliaDataFrame(entityDF)
    }
    #the body for if(is.null()) ends here
  } else {
    cliaDF=cliaDataFrame
  }
  
  #get the clia for the proccesedByEntity using cliaDF
  a=match(testDataFrame$processedByEntity.entityId, cliaDF$entityId)
  aa=cliaDF$clia[a]
  aaa=ifelse(is.na(aa),"",aa)
  
  # add the clias as processedByEntity.clia after processedByEntity.name
  NewFrame=add_column(testDataFrame, processedByEntity.clia=aaa, .after = "processedByEntity.name")
  
  #get the clia for the orderedByEntity using cliaDF
  b=match(testDataFrame$orderedByEntity.entityId, cliaDF$entityId)
  bb=cliaDF$clia[b]
  bbb=ifelse(is.na(bb),"",bb)
  
  ## add the clias as orderedByEntity.clia after orderedByEntity.name
  NewFrame=add_column(NewFrame, orderedByEntity.clia=bbb, .after = "orderedByEntity.name")
  
  return(NewFrame)
}
