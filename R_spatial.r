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
