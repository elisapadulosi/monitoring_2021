# R spatial 

library(sp)

data(meuse)
head(meuse)

# I'm going to use coordinates of the dataset (use of ~ to group the objects)
coordinates(meuse)= ~x+y

# now that I have explained to R that I want to use coordinates, I can plot to see them in a spatial way
plot(meuse)

# use a function to see the spread of elements (zinc, lead..) in space in the dataset
spplot(meuse,"zinc",main="Concentration of zinc")

#Exercise: plot the concentration of copper
spplot(meuse,"copper",main="Concentration of copper")

#Exercise: see copper and zinc using c("...","...")
spplot(meuse,c("copper","zinc"))

#Use bubble funcion instead of colors
bubble(meuse,"zinc")

bubble(meuse,"lead", col="blue")

#16/11/2020 
#install ggplot2 library
install.packages("ggplot2")
library(ggplot2)

#ecological dataframe
# biofuels
biofuels <- c(120,200,350,570,750) #array of values:c
biofuels
#oxydative enzimes
oxydative <- c(1200,1300,21000,34000,50000)

# define dataframe
d <- data.frame(biofuels,oxydative)#the arrow means that d is the name of the dataframe
d

ggplot(d,aes(x=biofuels,y=oxydative)) #white board
# now we have to decide what we want to use to plot (lines, points..)# we have to choose the geometry
ggplot(d,aes(x=biofuels,y=oxydative))+geom_point()
# change the colors and size
ggplot(d,aes(x=biofuels,y=oxydative))+geom_point(col="blue", size=5)

# line instead of points
ggplot(d,aes(x=biofuels,y=oxydative))+geom_line(col="blue", size=5)

# use points and lines together
ggplot(d,aes(x=biofuels,y=oxydative))+geom_point(col="blue", size=5) + geom_line()

# use polygons
ggplot(d,aes(x=biofuels,y=oxydative))+geom_polygon()

#IMPORT DATA FROM AN EXTERNAL SOURCE!!
# setwd("path/lab")
setwd("/Users/Elisa Padulosi/iCloud Drive/Scrivania/LAB/")


covid<-read.table("covid_agg.csv", header=TRUE)




