#' Returns table With Number of tests recieved up to a specified dealy, by test type and result
#'
#' @param data_frame data_frame of tests to be considered (data frame or tibble)
#' @param delay number of days after report to be considered (integer, defaults to 1)
#' @param date_mode date by which to group tests i.e sample, report, or upload (string, defaults to "report")
#' @param cutoff number of days passed since today (Sys.Date()) (integer, defaults to 30)
#' @param delay_mode currently unused.
#' @return returns data frame with specified conditions
#' @export


testApiPositivesOnTime<-function(data_frame=All_Tests, delay=1,
                                 date_mode="report",cutoff=30, delay_mode="UR"){

  T<-data.frame(matrix(nrow=4,ncol=6))
  colnames(T)<-c("Fechas Consideradas","Cantitdad de Pruebas (Ultimos 30 Dias)",
                 paste("Cantidad de Prubas Con Diferencia <= ",delay,"  Dia(s)", sep=""),"Porciento (%)","Resultado","Tipo de Prueba")

  day=as.Date(Sys.Date())-cutoff
  today=as.Date(Sys.Date())
  T[,1]<-paste(day," to ",today, sep="")



  r=date_mode=="report"
  s=date_mode=="sample"
  u=date_mode=="upload"

  rbool=data_frame$orderResult.reportedDate>=(as.Date(Sys.Date())-cutoff)
  sbool=data_frame$sampleCollectedDate>=(as.Date(Sys.Date())-cutoff)
  ubool=data_frame$orderResult.createdAtDate>=(as.Date(Sys.Date())-cutoff)

  date_bool=(r&rbool+s&sbool+u&ubool)

  S=subset(data_frame, date_bool)

  a<-nrow(testApiSubset(data_frame=S, result_type="not positive", test_type="pcr"))
  B<-testApiSubset(data_frame=S, result_type="not positive", test_type="pcr")
  b<-nrow(subset(B, TatUploadReport>=0 & TatUploadReport<=delay))

  T[1,c(2:6)]<-c(a,b, b/a*100, "Not Positive","PCR")

  c<-nrow(testApiSubset(data_frame=S, result_type="positive", test_type="pcr"))
  D<-testApiSubset(data_frame=S, result_type="positive", test_type="pcr")
  d<-nrow(subset(D, TatUploadReport>=0 & TatUploadReport<=delay))

  T[2,c(2:6)]<-c(c,d, d/c*100, "Positive","PCR")


  e<-nrow(testApiSubset(data_frame=S, result_type="not positive", test_type="sero"))
  F<-testApiSubset(data_frame=S, result_type="not positive", test_type="sero")
  f<-nrow(subset(F, TatUploadReport>=0 & TatUploadReport<=delay))

  T[3,c(2:6)]<-c(e,f, f/e*100, "Not Positive","Serological")

  g<-nrow(testApiSubset(data_frame=S, result_type="positive", test_type="sero"))
  H<-testApiSubset(data_frame=S, result_type="positive", test_type="sero")
  h<-nrow(subset(H, TatUploadReport>=0 & TatUploadReport<=delay))

  T[4,c(2:6)]<-c(g,h, h/g*100, "Positive","Serological")





  return(T)
}
