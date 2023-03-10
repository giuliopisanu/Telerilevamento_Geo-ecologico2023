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

