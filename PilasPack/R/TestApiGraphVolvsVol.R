

TestApiGraphVolvsVol <- function(Tabla1 , X1 = "sampleCollectedDate", y1 = "NumberOfSamples", 
	Tabla2, X2 = "createdAtDate", y2 = "NumberOflogs",Col1 ="Samples", Col2 = "Logs"){
	ggplot2::ggplot(Tabla1, aes(x = X1, y = y1))+
	  geom_line(aes(col = Col1 ))+
	  geom_line( aes(x = X2,y= y2, col = Col2 ))+
	  labs(title = titulo, y = EjeY, x = EjeX)+
	  theme_bw()

}