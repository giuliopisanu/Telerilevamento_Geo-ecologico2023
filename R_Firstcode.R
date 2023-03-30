# My first code in git hub
# Let's install the raster pakage in R
install.packages ("raster")

library (raster)
> #import data
> setwd("C:/Lab_telerilevamento/")
#per identificare la posizione dell'immagine di studio si cerca il numero del path e poi si incrocia con la riga 
#in questo caso path 224 riga 63
#carichiamo le immagini
l2011<- brick ("p224r63_2011_masked.grd")
# stampa immagini
plot(l2011)
#cambiare i colori nel plot
#100 sono le sfumature
cl <- colorRampPalette(c("red", "orange","yellow"))(100)
 plot (l2011, col=cl)
#plottare un solo elemento
#si identificano con le Parentesi quadre, solo  il quarto elemento
plot (l2011[[4]], col=cl)
#Oppure richiamiamo il singolo elemento con il proprio nome :nome immagine $ nome elemento
plot (l2011$B4_sre, col=cl)
# possiamo assegnare una variabile all'elemento e richiamare quella 
 plot(nir)
> plot (l2011$B4_sre, col=cl)
> plot (l2011$B4_sre, col=cl)(3)
Errore: tentativo di applicare una non-funzione
> cl <- colorRampPalette(c("red", "orange","yellow"))(3)
> plot (l2011$B4_sre, col=cl)
# Plot of l2011 in the NIR channel (NIR band)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)
# or:
plot(l2011[[4]])

# Landsat ETM+
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# plot RGB layers
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")

plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Exercise: build a multiframe with visible RGB
# (linear stretch) on top of false colours
# (histogram stretch)
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Exercise: upload the image from 1988
l1988 <- brick("p224r63_1988.grd")
l1988

par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
 Plot(l1988,[[4]])
Errore: '[[' inatteso in "Plot(l1988,[["
> Plot(l1988[[4]])
Errore in Plot(l1988[[4]]) : non trovo la funzione "Plot"
> plot(l1988[[4]])
#cambioma colore alla banda del vicino infrarosso
> plotRGB(l1988,r=3,g=2,b=1, stretch="lin")
> plotRGB(l1988,r=4,g=3,b=2, stretch="lin")
> plotRGB(l1988,r=3,g=4,b=2, stretch="lin")
> plotRGB(l1988,r=3,g=2,b=4, stretch="lin")
#per mostrare due immagini sovrapposte per confrontarle visivamente
 par(mfrow=c(2,1))
> plotRGB(l1988,4,3,2, stretch="lin")
> plotRGB(l2011,4,3,2, stretch="lin")
#per chiudere le immagini
dev.off()
#Modificare le forma di stretch
plotRGB(l1988,4,3,2, stretch="hist")
#Plottare immagini multiple
 par(mfrow=c(2,2))
> plotRGB(l1988,4,3,2, stretch="lin")
> plotRGB(l2011,4,3,2, stretch="lin")
> plotRGB(l1988,4,3,2, stretch="hist")
> plotRGB(l2011,4,3,2, stretch="hist")

> #per risolvere i problemi quando non carica le immagini png 
getwd()
setwd("C:/Lab_Telerilevamento/")
library(grid)
library(png)
img<- readPNG("deformazione1.png")
defor1<-rasterGrob(img, interpolate = TRUE)
grid.draw(defor1)
#lezione 5
par(mfrow=c(2,1))
plotRGB(l1992, 1, 2, 3 ;stretch= 'lin')
plotRGB(l2006, 1, 2, 3 ;stretch= 'lin')
# sottrazione fra immagini

ndvi1992 = (l1992[[1]] - l1992[[2]])
# DVI Difference Vegetation Index
dvi1992 = l1992[[1]] - l1992[[2]]
# or:
# dvi1992 = l1992$defor1_.1 - l1992$defor1_.2
dvi1992

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

# DVI Difference Vegetation Index
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006

plot(dvi2006, col=cl)


# DVI difference in time
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvi_dif, col=cld)

#- day 2

# Range DVI (8 bit): -255 a 255
# Range NDVI (8 bit): -1 a 1

# Range DVI (16 bit): -65535 a 65535
# Range NDVI (16 bit): -1 a 1

# Hence, NDVI can be used to compare images with a different radiometric resolution

# NDVI 1992
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])
# or
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(ndvi1992, col=cl)

# multiframe con il plotRGB dell'immagine sopra
# e l'ndvi sotto

# Multiframe with plotRGB on top of the NDVI image
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)

# 2006
ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])

# Multiframe with NDVI1992 on top of the NDVI2006 image
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)




