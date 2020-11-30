#Point pattern analysis

install.packages("spatstat")
library(spatstat)

#point pattern (ppp=planar point pattern) in spatstat
attach(covid)
# x,y and ranges #c for the array
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

#lat's do the density map
density_map<-density(covid_planar)
#plot the density map #from the map we can see  that Europe was the most dense country
plot(density_map)
points(covid_planar)
#how to change the colors of the map
cl <- colorRampPalette(c('yellow','orange','red'))(100) #
plot(density_map, col=cl)
points(covid_planar)

#let's change the colors again
cl <- colorRampPalette(c('blue','orange','green'))(100) #
plot(density_map, col=cl)
points(covid_planar)

#putting countries on top of the map (we will need another package)
install.packages("rgdal")

#####23/11/2020 plot the density and interpulation
# to use rgdal
library(rgdal)
#import data from 10m coastline
coastline<-readOGR("ne_10m_coastline.shp")

plot(density_map, col=cl)
points(covid_planar)
#add coastline
plot(coastline, add=TRUE)
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
#let's change the points
points(covid_planar, pch=19)

# to export the map
#in png
png("figure 1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#in pdf
pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#INTERPOLATION
#explain to R where to find the data
marks(covid_planar)<-cases
# function to do the interpulation (Smooth)
cases_map<-Smooth(covid_planar)
plot(cases_map, col = cl)
plot(coastlines, add = T)
points(covid_planar)


##### 27/11/2020
# plotting points with different with differet size related to covid data together with the interpolation
setwd("/Users/elisapadulosi/Desktop/LAB/") #to recall the working directory
library(spatstat)
library(rgdal)
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)

#new package sf
install.packages("sf")
library(sf)

Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
plot(cases_map, col=cl)
plot(Spoints, cex=Spoints$cases, col="purple3", lwd=3, add=T)

plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

#add to the map the coastlines
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add = TRUE)



#### 30/11/2020 # use of Zabotti data

setwd("/Users/elisapadulosi/Google Drive/LAB/") #recall directory (now lab folder is in Google Drive)
leo<- read.table("dati_zabotti.csv", header=T, sep=",") #personal reminder: when saving a file, use csv, not pdf

head(leo)
attach(leo)
library(spatstat)

#to have the minimum and maximum x and y
summary(leo)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
plot(leo_ppp)

density_map<-density(leo_ppp)
plot(density_map)
points(leo_ppp)








