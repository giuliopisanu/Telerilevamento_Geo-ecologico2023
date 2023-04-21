install.packages("patchwork")
setwd("C:/Lab_Telerilevamento/")
library(terra)
library(ggplot2)
library(patchwork)
defor_1<-rast("defor1.png")
defor_2<-rast("defor2.png")
singlenr1 <- values(defor_1)
kcluster1 <- kmeans(singlenr1, centers = 2)
defor1class <- setValues(defor_1[[1]], kcluster1$cluster)
singlenr2 <- values(defor_2)
kcluster2 <- kmeans(singlenr2, centers = 2)
defor2class <- setValues(defor_2[[1]], kcluster2$cluster)
plot(defor2class)
frequencies1<-freq(defor1class)
frequencies1

tot1<- ncell(defor1class)
 percentages1<-frequencies1*100/tot1
 
 frequencies2<-freq(defor2class)
 tot2<- ncell(defor2class)
 percentages2<-frequencies2*100/tot2

#generiamo degli istogrammi con i valori delle classi 
#final table
cover<-c("Forest","Bare soil")
percent_1992<-c(89.75, 10.25)
percent_2006<-c(52.07, 47.93)  
percentages<-data.frame(cover,percent_1992,percent_2006)



#plottiamo degli istogrammi
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover))+
geom_bar(stat="identity", fill="white")
p1<-ggplot(percentages, aes(x=cover, y=percent_1992, color=cover))+
geom_bar(stat="identity", fill="white")+
ggtitle("Year 1992")
p2<-ggplot(percentages, aes(x=cover, y=percent_2006, color=cover))+
geom_bar(stat="identity", fill="white")+
ggtitle("Year 2006")
p1+p2
#mettiamo la stessa scala in entrambi grafici
# ylim(c(0,100))

ggplot(percentages, aes(x=cover, y=percent_1992, color=cover))+
geom_bar(stat="identity", fill="white")
p1<-ggplot(percentages, aes(x=cover, y=percent_1992, color=cover))+
geom_bar(stat="identity", fill="white")+
ggtitle("Year 1992")+
ylim(c(0,100))

p2<-ggplot(percentages, aes(x=cover, y=percent_2006, color=cover))+
geom_bar(stat="identity", fill="white")+
ggtitle("Year 2006")+

ylim(c(0,100))

p1+p2
#mettiamo la stessa scala in entrambi grafici
# ylim(c(0,100))





