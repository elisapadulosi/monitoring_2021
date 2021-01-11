#### 11/01/2021  R code for exam simulation
install.packages("ncdf4") #to read the Copernicus data
library(ncdf4)

setwd("/Users/elisapadulosi/Google Drive/LAB/") #to set the working directory
library(raster)

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc") # temperature data from Copernicus

plot(tjan)
cltjan <- colorRampPalette(c('black','grey','light grey'))(100)# colors

cltjan <- colorRampPalette(c('blue','yellow','red'))(100) 
plot(tjan, col=cltjan) # to change the colors

#difference between the temperature of january and october at the soil level # higher the difference->more red the image
dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif) # if it gives an error it's because you have to download the january data from Copernicus also

