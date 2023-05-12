#installiamo il pacchetto 
install.packages("ncdf4")
library(terra)
library(ncdf4)
library(ggplot2)
library(viridis)
setwd("C:/Lab_Telerilevamento/")
# dataset: c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc
sc <- rast("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")
#rast carica due laier 1 l'immagine  2 l'incertezza (plottare il primo livello)
plot(sc[[1]])

