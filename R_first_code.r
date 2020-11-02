# Biodiversity

# this is an array
primates <- c(3, 5, 9, 15, 40)
primates

# new set:
crabs <- c(100, 70, 30, 10, 5)
crabs

# first plot in R
plot(primates, crabs)

plot(primates, crabs, col="green")

plot(primates, crabs, col="green", pch=19)

plot(primates, crabs, col="green", pch=19, cex=2)

plot(primates, crabs, col="green", pch=19, cex=6)

plot(primates, crabs, col="green", pch=19, cex=6, main="My first ecological graph in R!")

# create a dataframe
ecoset <- data.frame(primates, crabs)
ecoset

# ecological numbers
# mean numbers of individuals per site
(3+5+9+15+40)/5

# summary of the dataframe
summary(ecoset)
