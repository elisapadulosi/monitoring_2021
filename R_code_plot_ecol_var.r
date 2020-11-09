# R code for plotting the relationships among ecological variables

install.packages("sp")
library(sp)

# data is used to recall datasets
data(meuse)

View(meuse)

head(meuse)


# Exercise
# mean of all the variables?
summary(meuse)

# plotting the variables (relationship between two variables)
# plot zinc (y) and cadmium (x)
#$
plot(meuse$cadmium, meuse$zinc)


# we can also use the attach function

attach(meuse)
plot(cadmium, zinc)
plot(cadmium,lead)

#to see all the possible relationships
#pairs function
pairs(meuse)

#how to pair only some elements of the dataset

# Second lecture on ecological variables

#recall the package sp, recall the dataset meuse
library(sp)
data(meuse)

pairs(meuse)
head(meuse)

#cadmium copper lead zinc
#pairs with soil variables
# from column 3 to 6
pairs(meuse[,3:6])

#let's use the name of the columns
pairs(~cadmium+copper+lead+zinc, data=meuse) 

#let's prettify the graph
#exercise: just ude cadmium, lead, zinc
pairs(~cadmium+copper+zinc, data=meuse) 

#exercise: change the color
pairs(~cadmium+copper+lead+zinc, data=meuse, col="green") 

#exercise: change the symbol to filled triangles
pairs(~cadmium+copper+lead+zinc, data=meuse, col="green", pch=17)

#increase the size of the triangle
pairs(~cadmium+copper+lead+zinc, data=meuse, col="green", pch=17, cex=3)

















