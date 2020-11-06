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
