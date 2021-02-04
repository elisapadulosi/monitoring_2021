## Australia bushfire season (June 2019-May 2020)

# needed packages
# Raster or "gridded" data are data that are saved in pixels. In the spatial world, each pixel represents an area on the Earth's surface.
install.packages("raster")
library(raster)

# used to read Copernicus data
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
# I choose to plot also the fires disturbance to see the  differences in occurrence from this period to others in Australia (in which they are very common)
# My hypothesis: NDVI before > NDVIafter  Tbefore < Tafter


# NDVI is used to observe if the vegetation is alive
# ndvi before Australia bushfire season (June 2019-May 2020) -> 10/04/2019
ndvibefore<-raster("c_gls_NDVI300_201904010000_GLOBE_PROBAV_V1.0.1.nc")

# ndvi after Australia bushfire season (June 2019-May 2020) -> 10/06/2020
ndviafter<-raster("c_gls_NDVI300_202006010000_GLOBE_PROBAV_V1.0.1.nc")

# ndvi during the bushfires Australia bushfire season (June 2019-May 2020) -> 29/02/2020
ndviduring<-raster("c_gls_NDVI300_202002210000_GLOBE_PROBAV_V1.0.1.nc")

 
# I want to study only Australia, so I must find its spatial coordinates
# I choose to study all the continent to see the widespread consequences
# let's crop the ndvibefore (the global one is too heavy to plot). 
ext<-c(110,155,-45,-10)#xmin xmax, ymin e ymax
ndvibefore<-crop(ndvibefore, ext)

#let's crop the ndviafter
ndviafter<-crop(ndviafter, ext)

#let's crop ndviduring
ndviduring<-crop(ndviduring, ext)

#let's plot using a palette
#before
Ncl <- colorRampPalette(c('red','gold','darkgoldenrod3',"cyan","cyan4","chartreuse1","darkgreen"))(100) # to define the color palette 
plot(ndvibefore, col=Ncl,main="NDVI before bushfires") #function main to name the graphs

#during
plot(ndviduring, col=Ncl,main="NDVI during bushfires")

#after
plot(ndviafter, col=Ncl,main="NDVI after bushfires")

# let's see the differences before and after
difbushfires<- ndvibefore-ndviafter
plot(difbushfires, col= Ncl) #south and east parts have decrease of ndvi, conistent with the drescrese in the vegetation due to the bushfires

#let's create a grapf with: ndvibefore, ndviduring, ndviafter, difbushfires
# par function to have multiple graphs in a single plot 
#used main to namw the table
par(mfrow=c(1,4)) # 1 row, 4 colums
plot(ndvibefore, col=Ncl,main="NDVI before bushfires")
plot(ndviduring, col=Ncl,main="NDVI during bushfires")
plot(ndviafter, col=Ncl,main="NDVI after bushfires")
plot(difbushfires, col= Ncl,main="NDVI differnce")



# TEMPERATURE (10 days-> to let the athmosphere react)
# temperature before Australia bushfire season (June 2019-May 2020) -> 1-10/04/2019
tbefore<- raster("c_gls_LST10-DC_201904010000_GLOBE_GEO_V1.2.1.nc")

#temperature during Australia bushfire season (June 2019-May 2020) -> 21-29/02/2020
tduring<-raster("c_gls_LST10-DC_202002210000_GLOBE_GEO_V1.2.1.nc")

#temperature after Australia bushfire season (June 2019-May 2020)-> 1-10/06/2020
tafter<- raster("c_gls_LST10-DC_202006010000_GLOBE_GEO_V1.2.1.nc")

#let's crop because we gave global data, but we are interested only in Australia
# ext<-c(110,155,-45,-10)#xmin xmax, ymin e ymax to crop the images (already defined)
# temperature before
tbefore<-crop(tbefore, ext)

#temperature during
tduring<-crop(tduring, ext)

#temperature after
tafter<-crop(tafter, ext)

#let's plot one T to see if the cooridates are correct
plot(tafter)
# the coordinates are correct!!

# so, let's plot and change the colors to the plotted images with the function colorRampPalette
# function main to name the graphs
# changed cl
tcl <- colorRampPalette(c('yellow2','goldenrod','darkred'))(100)
# before
plot(tbefore, col=tcl,main="T before bushfires")

#during
plot(tduring, col=tcl,main="T during bushfires")

#after
plot(tafter, col=tcl,main="T after bushfires") #increase in T

# let's see the differences before and after
tdifbushfires<- tafter-tbefore
plot(tdifbushfires, col= tcl, main="difference T before and after") # higher the difference->more red the image

#let's create a grapf with: tbefore, tduring, tafter, tdifbushfires
# par function to have multiple graphs in a single plot 
#used main to name the table
par(mfrow=c(1,4)) # 1 row, 4 colums
plot(tbefore, col=tcl,main="T before bushfires")
plot(tduring, col=tcl,main="T during bushfires")
plot(tafter, col=tcl,main="T after bushfires")
plot(tdifbushfires, col= tcl, main="difference T before and after")



# BUSHFIRES
# I took also the fires before and after that period to see if there were the same fires in the past
# bushfires before Australia bushfire season (June 2019-May 2020)-> 21-30/04/2015
beforefires<-raster("c_gls_BA300_201504300000_GLOBE_PROBAV_V1.0.1.nc")

# bushfires during Australia bushfire season (June 2019-May 2020) -> 21-29/02/2020
duringfires<-raster("c_gls_BA300_202002290000_GLOBE_PROBAV_V1.1.1.nc")

# bushfires after Australia bushfire season (June 2019-May 2020) -> 1-10/06/2021
afterfires<-raster("c_gls_BA300_202101100000_GLOBE_PROBAV_V1.1.1.nc")

#let's crop on Australia
#before
beforefires<-crop(beforefires, ext)

#during
duringfires<-crop(duringfires, ext)

#after
afterfires<-crop(afterfires, ext)

#let's plot and change the colors to the plotted images with the function colorRampPalette
fcl <- colorRampPalette(c("white", "darkred"))(2)

# function main to name the graphs
# before
plot(beforefires, col=fcl,main="fires before the season")# seems to be no fires

#during
plot(duringfires, col=fcl,main="fires during the season")

#after
plot(afterfires, col=fcl,main="fires after the season")

# let's see the differences before and after
difbushfires<- beforefires-afterfires
plot(difbushfires, col= fcl, main="difference fires before and after")# no difference

#let's see the difference during and after
diflastyear <- duringfires-afterfires
plot(diflastyear, col=fcl, main="new fires due to 2019 fires season")
# have increased the fires in the south and east part of Australia -> consistent with the bushfires season

#let's create a grapf with: beforefires, duringfires, afterfires, difbushfires
# par function to have multiple graphs in a single plot 
#used main to namw the table
par(mfrow=c(1,4)) # 1 row, 4 colums
plot(beforefires, col=fcl,main="fires before the season")
plot(duringfires, col=fcl,main="fires during the season")
plot(afterfires, col=fcl,main="fires after the season")
plot(difbushfires, col= fcl, main="difference fires before and after")

# let's crop closer the area of the bushfires (south east) in order to study in a better way the situation
ext2<-c(140,155,-45,-30)
duringfires<-crop(duringfires, ext2)
plot(duringfires, col=fcl,main="new fires due to 2019 fires season")


#let's do a scatter plot to see how T and bushfires are correlated
# not possible with the Copernicus data 
plot(duringfires$Time,tduring$weight)
# need to change the configuration of the data


# JUST FOR FUN
# I wanted to see all the possible colors that can be used
# So I took different functions of the Color Palettes and see what happens
 heat.colors(afterfires, alpha = 1, rev = FALSE)
#funtion, where n is the number of colors to be in the Palette and  alpha is the transparency. Rev is to reverse the colors.
# total of 248 colors. I want to see them all using the function barplot
n=248
barplot(rep(1, n), col = heat.colors(248))

barplot(rep(1, n), col = rainbow(248))

barplot(rep(1, n), col = terrain.colors(248))

barplot(rep(1, n), col = topo.colors(30))

barplot(rep(1, n), col = cm.colors(30))










