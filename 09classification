#07.12
#classification. grouping the pixels to represent the final class. we can see how the pixel reflects in the infrared. 
#clusters: same characteristics. we are going to estimate how much the pixels are far from each others, they are related to each others. we can assign to every single pixel a cluster/class.
#im.classify

#classifying satellite images and estimate the amount of change of different classes
library(terra)
library(imageRy)

im.list

##estimating how much - quantative difference between two images. 

#07.12
#classification. grouping the pixels to represent the final class. we can see how the pixel reflects in the infrared. 
#clusters: same characteristics. we are going to estimate how much the pixels are far from each others, they are related to each others. we can assign to every single pixel a cluster/class.
#im.classify

#classifying satellite images and estimate the amount of change of different classes
library(terra)
library(imageRy)

im.list()
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#gases on the sun, more or less three levels of energy

sunc <- im.classify(sun, num_clusters=3)
sunc


##map of the three levels amount of energy

plot(sunc)
plot(sunc[[1]])

##from the original image we can see that the class number 3 is the class with the higher energy. 
##we now apply this to the image of mato grosso to see if there is a change.

#classify satellite data
im.list()


m1992 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m2006 <- im.import("matogrosso_l5_1992219_lrg.jpg")

plotRGB(m1992)

#we can do a classification of these images. we use just 2 clusters here.

m1992c <- im.classify(m1992, num_clusters=2)
plot(m1992c)
plot(m1992c[[1]])

#classes: forest=1; human=2

m2006c <- im.classify(m2006, num_clusters=2)

plot(m2006c)

par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[2]])

##what is the proportion of each class? 
#there is a function which is called freq: frequency of a certain class
#is is counting the number of pixels for each class

f1992 <- freq(m1992c[[1]])
f1992











