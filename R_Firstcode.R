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

> 



