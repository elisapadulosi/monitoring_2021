##### 7/01/2021 R code for remote sensing analysis in ecosystem

# needed libraries
library(raster)
library(RStoolbox)

setwd("/Users/elisapadulosi/Google Drive/LAB/")
p224r63_2011 <- brick("p224r63_2011_masked.grd") #brick function make possible to see the layers
p224r63_2011 #to have information about one of the seven layers
plot(p224r63_2011)

cl <- colorRampPalette(c('black','grey','light grey'))(100) # change colorsù
plot(p224r63_2011, col=cl)

par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=clnir)

plotRGB #to see the colors of an image #then stretch the colors to see better the image
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") #to see the image in the near infrared, we see better the connections con the trees of the forest
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") # to see the forest in an another perspective
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
