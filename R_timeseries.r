caricare imagini



lst2000 <- raster("lst_2000.tif")
# caricare una lista di oggetti
#caricare le immagini con il pacchetto terra

lst2000 <- rast("C:/Lab_Telerilevamento/Greenland/lst_2000.tif") 
lst2005 <- rast("C:/Lab_Telerilevamento/Greenland/lst_2005.tif") 
lst2010 <- rast("C:/Lab_Telerilevamento/Greenland/lst_2010.tif") 
lst2015 <- rast("C:/Lab_Telerilevamento/Greenland/lst_2015.tif") 

 
# argomento non utilizzato (new("SpatRaster", ptr = new("Rcpp_SpatRaster", .xData = <environment>)))
st <- c(lst2000, lst2005)


st <- stack(lst2000, lst2005)
plot(st)
# Errore in h(simpleError(msg, call)) : 
#  errore durante la valutazione dell'argomento 'x' nella selezione di un metodo per la fun


library(raster)

library(terra)

setwd("C:/Lab_Telerilevamento/Greenland/") 
rlist <- list.files(pattern="lst")
impr <- lapply(rlist,raster)

class      : RasterLayer 
dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
resolution : 1546.869, 1546.898  (x, y)
extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
source     : lst_2000.tif 
names      : lst_2000 


[[2]]
class      : RasterLayer 
dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
resolution : 1546.869, 1546.898  (x, y)
extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
source     : lst_2005.tif 
names      : lst_2005 


[[3]]
class      : RasterLayer 
dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
resolution : 1546.869, 1546.898  (x, y)
extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
source     : lst_2010.tif 
names      : lst_2010 


[[4]]
class      : RasterLayer 
dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
resolution : 1546.869, 1546.898  (x, y)
extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
source     : lst_2015.tif 
names      : lst_2015 

plot(imp[[1]])

gr <- stack(impr)

class      : RasterStack 
dimensions : 1913, 2315, 4428595, 4  (nrow, ncol, ncell, nlayers)
resolution : 1546.869, 1546.898  (x, y)
extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
names      : lst_2000.tif, lst_2005.tif, lst_2010.tif, lst_2015.tif 

plot(gr[[1]])

 #stampare le immagini dopo averle accorpate con Terra::c
tgr <- c(lst2000, lst2005, lst2010, lst2015)
> plot(tgr)
> plotRGB(tgr, r=1 ,g=2 , b=3 ,stretch = "lin" )
> 
 plotRGB(tgr, r=2 ,g=3 , b=4 ,stretch = "lin" )
#
dift<-  tgr[[2]]-tgr[[1]]
> plot(dift)
#cambiamo palette di colori
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
> plot(tgr, col=cl)
#carichiamo le immagini en
 en0001<-rast("C:/Lab_Telerilevamento/EN/EN_0001")


