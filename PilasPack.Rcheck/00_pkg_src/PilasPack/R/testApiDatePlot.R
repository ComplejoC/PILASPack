#' Generates Plots that include dates in the x axis
#'
#' @param data_frame A data frame that has already been manipulated by testApiCalculateTurnaround, testApiToDates and testApiMonthAsColumn.
#' @param col="Sampled" The colummn of to be plotted (can be "Sampled","Reported" or "Uploaded")
#' @param colour="blue" color to use for fill
#' @param y_label="Cantidad de Pruebas"
#' @param title="Pruebas" Title to use for plot
#' @param infer_labels=FALSE boolean. If TRUE, infers labels from col
#' @export
#' @import ggplot2
#' @return Plot of data changing over time
#' @examples
#' testApiDatePlot(PCR_Test)
#' testApiDatePlot(PCR_Test, col = "Reported")
#'

testApiDatePlot<-function(data_frame, col="Sampled",
                          colour="blue",
                          x_label="Fecha", y_label="Cantidad de Pruebas",
                          title="Pruebas", infer_labels=FALSE){

  #set the labels to the ones provided; might change if infer_labels is TRUE
  x_text=x_label
  y_text=y_label
  t_text=title


  col_ind<-which(colnames(data_frame)==col)

  #infer the labels from the column name
  if(infer_labels){
    if(col=="Sampled"){
      x_text="Fecha de Muestra"
      y_text="Cantidad de Pruebas"
      t_text="Pruebas Realizadas, Por Fecha de Muestra"
    } else if(col=="Reported"){
      x_text="Fecha de Reporte"
      y_text="Cantidad de Pruebas"
      t_text="Pruebas Realizadas, Por Fecha de Reporte"
    } else if(col=="Uploaded"){
      x_text="Fecha de Entrada a Bioportal"
      y_text="Cantidad de Pruebas"
      t_text="Pruebas Realizadas, Por Fecha de Entrada a Bioportal"
    }

  }




  g<-ggplot2::ggplot(data_frame,
            aes(x=as.Date(data_frame[,1]),y=data_frame[,col_ind])) +geom_col(fill=colour, color="black")+
    theme_bw()+labs(x=x_text, y=y_text, title = t_text)
  return(g)
}

