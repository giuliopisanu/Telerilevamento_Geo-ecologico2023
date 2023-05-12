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
scd <-as.data.frame(sc, xy= T)
ggplot()+
geom_raster(scd, mapping = aes(x=x,y=y, fill=ssm))+
ggtitle("Surface soil moisture")
#cropping an immage
ext <- c(23, 30, 62, 68)
sc_crop <-crop(sc, ext)
plot(sc_crop[[1]])

#plottiamo l'immagine ritagliata
scd_crop <-as.data.frame(sc_crop, xy= T)
ggplot()+
geom_raster(scd_crop, mapping = aes(x=x,y=y, fill=ssm))+
ggtitle("Surface soil moisture _cropped img")+
scale_fill_viridis(option="cvidis")

ggplot()+
geom_raster(scd_crop, mapping = aes(x=x,y=y, fill=ssm))+
ggtitle("Surface soil moisture _cropped img")+
scale_fill_viridis(option="viridis")

#per recuperare file contenenti r_code si usa 
#Source("copernicus_file_R.txt")






