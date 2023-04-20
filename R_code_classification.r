library(terra)
terra 1.6.41
 setwd("C:/Lab_Telerilevamento/")
 gc<-rast("dolansprings_oli_2013088_canyon_lrg.jpg")
 plot(gc)
 gcc<-crop("dolansprings_oli_2013088_canyon_lrg.jpg")
 singlenr <- values(gc)
 kcluster <- kmeans(singlenr, centers = 3)
 #1 volcanic rocks ; 2 sandstone; 3 conglomerates
 gcclass <- setValues(gc[[1]], kcluster$cluster)
 plot(gcclass)
 frequencies<-freq(gcclass)
 frequencies
 total<- ncell(gcclass)
 #percentuale corrispondente al n di pixel per ogni singola classe sul totale  sul totale
> percentages<- frequencies*100/total
> percentages
# install ggplot2 packages



 

