#' Plots Positivity results
#'
#' @param DataFrame A Data Frame object with calculated positivity
#' @param fromTests
#' @return Positivity plot
#' @export
#' @import ggplot2
#' @examples
#' testApiPositivityPlot(PCR_Test)
#' testApiPositivityPlot(ByLab_Test)

testApiPositivityPlot<-function(DataFrame, fromTests=FALSE){

  g<-ggplot2::ggplot(data=DataFrame, aes(x=Fecha)) +geom_bar(stat = "identity", aes(y=`Total Reported`, fill="cyan")) +geom_bar(stat = "identity", aes(y=`Positives`, fill="magenta")) +scale_fill_discrete(name="Tests:", labels=c("Total","Positives")) + labs(x="Report Date", y="Number of Tests Reported", title="Number of Tests Reported by Date") +theme_bw()

  return(g)
}
