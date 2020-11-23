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

#23/11/2020 plot the density and interpulation
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







