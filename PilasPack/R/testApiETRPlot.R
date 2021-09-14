#' Plots ETR results
#'
#' @param DataFrame A Data Frame object with calculated ETR
#' @return ETR Plot
#' @export
#' @import ggplot2
#' @examples
#' testApiETR(All_Tests)%>%testApiPositivityPlot()

testApiETRPlot<-function(DataFrame, fromTests=FALSE){

  g<-ggplot(data=DataFrame, aes(x=Fecha)) +geom_bar(stat = "identity", aes(y=DataFrame[,4], fill="cyan")) +geom_bar(stat = "identity", aes(y=DataFrame[,2], fill="magenta")) +scale_fill_discrete(name="Tests:", labels=c("Total Uploaded","Sent Electronically")) + labs(x="Upload Date", y="Number of Tests Uploaded", title="Number of Tests Uploaded by Date") +theme_bw()

  return(g)
}
