#### 22/01/2021 Specie distribtion model
install.packages("sdm")
library(raster)
library(rgdal)

# import the specie data (the data are in the sdm package)
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file) 

#to see the set
species 

#occurence of the species
plot(species)
plot(species, pch=17)
species$Occurrence

#to change the color of the points of the occurrence map
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

path <- system.file("external", package="sdm")
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

#elevation
preds <- stack(lst)
 
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=17)

plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)

cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], col='blue', pch=17)

#sppecie occurence to temperature
plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

#precipitation
plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)

#vegetation
plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

datasdm <- sdmData(train=species, predictors=preds)
datasdm

#model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)

# add to the stack (all the graphs of the variables together)
s1 <- stack(preds,p1)
plot(s1, col=cl)




 



