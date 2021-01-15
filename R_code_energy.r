
### 15/01/2021 R code energy
install.packages("rasterdiv")#needed library that contain data of the energy flow
library(rasterdiv)
library(raster)

data(copNDVI)#data taken from Copernicus
plot(copNDVI) #map with a blue backgroung (no meaning), we have to remove it

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))#to remove the blue and brown parts

install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI) 

# to change colors
clymin <- colorRampPalette(c('yellow','red','blue'))(100) # 
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) #blue as for the highest values-> wrong map
plot(copNDVI, col=clymed) 

clymax <- colorRampPalette(c('red','blue','yellow'))(100) # yellow for the highest values
plot(copNDVI, col=clymax)

clymax <- colorRampPalette(c('blue','red','yellow'))(100) # red and yellow for the maximum value (good map) because the eye perceive more these colors at first
plot(copNDVI, col=clymax)

#  put 2 maps together (wrong and right map)
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

#to zoom in parts of the map (we have to choose an extension, x->longitude, y->latitude)
#function crop to crop in relation to the Italy extension
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)






 
