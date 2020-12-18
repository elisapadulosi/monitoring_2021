### 18/12/2020 multivariate analysis to analyse community data
# vagan (vegetation analysis)

install.packages("vegan")
library(vegan)
setwd("/Users/elisapadulosi/Google Drive/LAB/") #to set the working directory

load ("biomes_multivar.RData")
ls() #list of files in the workspace
head(biomes)# we see many dimensions-->we want to put data in only two dimensions #we see only the first 6 biomes, with biomes_types we see all of them

#to see correspondences between species (close species-->they live together)
multivar <- decorana(biomes)
multivar
plot(multivar)#show the species that live together

head(biomes_types)
#biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)# I obtain a graph with ellipses that close the biomes
    
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) # it connects the species to the biome (like a spider web)


#to export the images
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off() #to close the function of taking images











