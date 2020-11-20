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
