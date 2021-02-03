## Australia bushfire season (June 2019-May 2020)

# needed packages

install.packages("raster")
library(raster)

install.packages("ncdf4")
library(ncdf4)

install.packages("RStoolbox")
library(RStoolbox)

install.packages("ggplot2")
library(ggplot2)

# set the workong directory
setwd("/Users/elisapadulosi/Google Drive/LAB/")

# NDVI
# ndvi before 10/04/2019
ndvibefore<-raster("c_gls_NDVI300_201904010000_GLOBE_PROBAV_V1.0.1.nc")

# ndvi after 10/06/2020
ndviafter<-raster("c_gls_NDVI300_202006010000_GLOBE_PROBAV_V1.0.1.nc")

# ndvi during the bushfires 29/02/2020
ndviduring<-raster("c_gls_NDVI300_202002210000_GLOBE_PROBAV_V1.0.1.nc")

#let's crop the ndvibefore (the global one is too heavy to plot). I want to study only Australia, so I must find its spatial coordinates
ext<-c(110,155,-45,-10)#xmin xmax, ymin e ymax
ndvibefore<-crop(ndvibefore, ext)

#let's crop the ndviafter
ndviafter<-crop(ndviafter, ext)

#let's crop ndviduring
ndviduringr<-crop(ndviduring, ext)

#let's plot and change the colors to the plotted images with the function colorRampPalette
#function main to name the graphs
#before
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndvibefore, col=cl,main="NDVI before bushfires")

#during
plot(ndviduring, col=cl,main="NDVI during bushfires")

#after
plot(ndviafter, col=cl,main="NDVI after bushfires")

# let's see the differences before and after
difbushfires<- ndvibefore-ndviafter
plot(difbushfires, col= cl) #south and east parts have decrease of ndvi, conistent with the drescrese in the vegetation due to the bushfires

#let's create a grapf with: ndvibefore, ndviduring, ndviafter, difbushfires
# par function to have multiple graphs in a single plot 
#used main to namw the table
par(mfrow=c(1,4)) # 1 row, 4 colums
plot(ndvibefore, col=cl,main="NDVI before bushfires")
plot(ndviduring, col=cl,main="NDVI during bushfires")
plot(ndviafter, col=cl,main="NDVI after bushfires")
plot(difbushfires, col= cl,main="NDVI differnce")











