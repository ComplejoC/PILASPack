#' Saves results from analysis, be it in table or graphic form
#'
#' @param AnalysisVar Variable that holds table with analysis done to the data, like turn over or volume
#' @param GraphVar Variable that holds the graph done for analysis
#' @param folder_name  Name of the directory you want to create to save your data
#' @param date_tag default is set to today but can be changed by writing a date in the format "%Y_%m_%d"
#' @param lab_tag  Name of the laboratory whose data you are analyzing
#' @param file_type_tag character string of type of analysis done
#' @param saveFile Do you want to save your table in to a file? default is true
#' @param saveGraph Do yo want to save your graph in to an image? default is true
#' @return graph or table of analysis done
#' @export
#' @import ggplot2
#' @examples
#' **work in progress**
save_test_api_analysis <- function(AnalysisVar = NULL ,GraphVar = NULL, folder_name,  date_tag = "today",
                                   lab_tag, file_type_tag, saveFile = TRUE, saveGraph = TRUE){

  if(date_tag == "today"){
    date_tag=format(as.Date(Sys.Date()), "%Y_%m_%d")
  }else{
    date_tag=as.Date(date_tag, "%Y_%m_%d")
  }
  if(saveFile == TRUE){
    if(is.null(AnalysisVar)){
      return(print("Can't save file without a table"))
    }
  }
  if(!dir.exists(folder_name)){
    dir.create(folder_name, recursive = TRUE)
    full_file_path=paste0(folder_name,"/",date_tag,"_",file_type_tag,"_",lab_tag,".csv")
    write.csv(AnalysisVar, full_file_path)
  }else{
    full_file_path=paste0(folder_name,"/",date_tag,"_",file_type_tag,"_",lab_tag,".csv")
    write.csv(AnalysisVar, full_file_path)
  }

  if(saveGraph == TRUE){
    if(is.null(GraphVar)){
      return(print("Can't save file without a Graph"))
    }
    full_path=paste0(folder_name,"/",date_tag,"_",file_type_tag,"_",lab_tag,".png")
    ggplot2::ggsave(full_path,GraphVar)
  }
}
