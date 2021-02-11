# Biodiversity

# this is an array. Primates is its name.
primates <- c(3, 5, 9, 15, 40)
primates

# new set:
crabs <- c(100, 70, 30, 10, 5)
crabs

# first plot in R
plot(primates, crabs)

# col to chanhe the colors
plot(primates, crabs, col="green")

#pch is plot character, to set the symbols
plot(primates, crabs, col="green", pch=19)

# cex to change the size
plot(primates, crabs, col="green", pch=19, cex=2)

plot(primates, crabs, col="green", pch=19, cex=6)

# main is to give a title
plot(primates, crabs, col="green", pch=19, cex=6, main="My first ecological graph in R!")

# create a dataframe
ecoset <- data.frame(primates, crabs)
ecoset

# ecological numbers
# mean numbers of individuals per site
(3+5+9+15+40)/5

# summary of the dataframe
summary(ecoset)
