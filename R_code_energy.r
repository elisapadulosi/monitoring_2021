
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


## 18/01/2021
# DEFORESTATION
library(raster)
library(RStoolbox)

setwd("/Users/elisapadulosi/Google Drive/LAB/") #to set the working directory
defor1 <- brick("defor1_.jpg")
defor1 #to have information about the file

plotRGB(defor1, 1, 2, 3, stretch="Lin") #123 because it's an red g(yellow) blue system


defor2 <- brick("defor2_.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#put the 2 images near one another
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#calculate the vegetation indices
# dvi for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
dev.off()
plot(dvi1)
#change the colors
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

#dvi2
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

#2 dvi together
par(mfrow=c(2,1))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

#difference biomass before cut and after cut
difdvi <- dvi1 -dvi2
dev.off()
plot(difdvi)
#colors (amount of biomass lost during the cut)
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif) #amount of energy lost because of the loss of biomass

#title of teh graph
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!") 

#histogram
hist(difdvi, col="red")

#####final analysis
#all these things together
#defor1
#defor2
#dvi1
#dvi2
#difdvi

par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")




 

