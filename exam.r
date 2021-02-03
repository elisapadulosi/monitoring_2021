## Australia bushfire season (June 2019-May 2020)

# needed packages
insall.packages("raster")
library(raster)

install.packages("rgdal")
library(rgdal)

insall.packages("ncdf4")
library(ncdf4)

insall.packages("RStoolbox")
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
ext<-c(12,42,105,162)
ndvibefore<-crop(ndvibefore, ext)

#let's crop the ndviafter
ext<-c(12,42,105,162)
ndviafter<-crop(ndviafter, ext)

#let's crop ndviduring
ext<-c(12,42,105,162)
ndviduringr<-crop(ndviduring, ext)

#let's plot and change the colors to the plotted images
#before
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndvibefore)

#during
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndviafter)

#after
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(ndviduring)

# let's see the differences before and after
difbushfires<- ndvibefore-ndviafter
plot(difbushfire, col= cl)

#let's create a grapf with: ndvibefore, ndviduring, ndviafter, difbushfires
# par function to have multiple graphs in a single plot 
par(mfrow=c(1,4)) # 1 row, 4 colums









