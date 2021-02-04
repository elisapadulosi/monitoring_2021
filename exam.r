## Australia bushfire season (June 2019-May 2020)

# needed packages
# Raster or "gridded" data are data that are saved in pixels. In the spatial world, each pixel represents an area on the Earth's surface.
install.packages("raster")
library(raster)

# used to read Copernicis data
install.packages("ncdf4")
library(ncdf4)

# Toolbox for remote sensing image processing and analysis such as calculating spectral indices,
install.packages("RStoolbox")
library(RStoolbox)

# how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.
install.packages("ggplot2")
library(ggplot2)

# set the workong directory
setwd("/Users/elisapadulosi/Google Drive/LAB/")

# for this project I want to study NDVI, fires disturbance and land surface temperature. See if and how those variables have changed over time due to the Australia bushfire season
# I choose to plot also the fires disturbance to see the  differences in occurrence from other fires in Australia (in which they are very common)
# My hypothesis: NDVI before > NDVIafter  Tbefore < Tafter


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
ndviduring<-crop(ndviduring, ext)

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



# TEMPERATURE (10 days-> to let the athmosphere react)
# temperature before 1-10/04/2019
tbefore<- raster("c_gls_LST10-DC_201904010000_GLOBE_GEO_V1.2.1.nc")

#temperature during 21-29/02/2020
tduring<-raster("c_gls_LST10-DC_202002210000_GLOBE_GEO_V1.2.1.nc")

#temperature after 1-10/06/2020
tafter<- raster("c_gls_LST10-DC_202006010000_GLOBE_GEO_V1.2.1.nc")

#let's crop because we gave global data, but we are interested only in Australia
# ext<-c(110,155,-45,-10)#xmin xmax, ymin e ymax to crop the images (already defined)
# temperature before
tbefore<-crop(tbefore, ext)

#temperature during
tduring<-crop(tduring, ext)

#temperature after
tafter<-crop(tafter, ext)

#let's plot one t to see if the cooridates are correct
plot(tafter)
# the coordinates are correct!!

# so, let's plot and change the colors to the plotted images with the function colorRampPalette
# function main to name the graphs
# before
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(tbefore, col=cl,main="T before bushfires")

#during
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(tduring, col=cl,main="T during bushfires")

#after
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(tafter, col=cl,main="T after bushfires") #increase in T

# let's see the differences before and after
tdifbushfires<- tbefore-tafter
plot(tdifbushfires, col= cl, main="difference T before and after")

#let's create a grapf with: tbefore, tduring, tafter, tdifbushfires
# par function to have multiple graphs in a single plot 
#used main to namw the table
par(mfrow=c(1,4)) # 1 row, 4 colums
plot(tbefore, col=cl,main="T before bushfires")
plot(tduring, col=cl,main="T during bushfires")
plot(tafter, col=cl,main="T after bushfires")
plot(tdifbushfires, col= cl, main="difference T before and after")



# BUSHFIRES
# bushfires before 1-10/04/2019
beforefires<-raster("c_gls_BA300_201904100000_GLOBE_PROBAV_V1.1.1.nc")

# bushfires during 21-29/02/2020
duringfires<-raster("c_gls_BA300_202002290000_GLOBE_PROBAV_V1.1.1.nc")

# bushfires after 1-10/06/2020
afterfires<-raster("c_gls_BA300_202006100000_GLOBE_PROBAV_V1.1.1.nc	")

#let's crop on Australia
#before
beforefires<-crop(beforefires, ext)

#during
duringfires<-crop(duringfires, ext)

#after
afterfires<-crop(afterfires, ext)

#let's plot and change the colors to the plotted images with the function colorRampPalette
# function main to name the graphs
# before
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(beforefires, col=cl,main="fires before the season")

#during
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(duringfires, col=cl,main="fires during the season")

#after
cl <- colorRampPalette(c('blue','red','yellow'))(100)
plot(afterfires, col=cl,main="fires after the season")

# let's see the differences before and after
difbushfires<- beforefires-afterfires
plot(difbushfires, col= cl, main="difference fires before and after")

#let's create a grapf with: beforefires, duringfires, afterfires, difbushfires
# par function to have multiple graphs in a single plot 
#used main to namw the table
par(mfrow=c(1,4)) # 1 row, 4 colums
plot(beforefires, col=cl,main="fires before the season")
plot(duringfires, col=cl,main="fires during the season")
plot(afterfires, col=cl,main="fires after the season")
plot(difbushfires, col= cl, main="difference fires before and after")

