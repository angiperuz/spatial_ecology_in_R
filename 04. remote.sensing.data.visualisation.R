#remote sernsing for ecosystem monitoring
install.packages("devtools")
library(devtools)

#remote sernsing for ecosystem monitoring
install.packages("devtools")
library(devtools)

devtools::install_github("angiperuz/imageRy")    #to install a package directly from github

library(imageRy)
im.list()

library(terra)

im.list()
im.import("sentinel.dolomites.b2.tif")
"sentinel.dolomites.b2.tif"
b2
b2 <- "sentinel.dolomites.b2.tif"
install.packages("terra")

#install_github se vuoi installare le cose direttamente da github
library(imagery)
library(terra)
#funtions for data import, im.list

#list the data
im.list()
b2 <- im.import("sentinel.dolomites.b2.tif") 

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(b2, col=cl)

# import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl)

# import the red band from Sentinel-2 (band 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)

# import the NIR band from Sentinel-2 (band 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

# multiframe
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# stack images
stacksent <- c(b2, b3, b4, b8)
dev.off() # it closes devices
plot(stacksent, col=cl)

plot(stacksent[[4]], col=cl)

# Exercise: plot in a multiframe the bands with different color ramps
par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(b2, col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(b3, col=clg)

clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(b4, col=clr)

cln <- colorRampPalette(c("brown", "orange", "yellow")) (100)
plot(b8, col=cln)

# RGB space
# stacksent: 
# band2 blue element 1, stacksent[[1]] 
# band3 green element 2, stacksent[[2]]
# band4 red element 3, stacksent[[3]]
# band8 nir element 4, stacksent[[4]]
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=4, g=3, b=2)
im.plotRGB(stacksent, r=3, g=4, b=2)
im.plotRGB(stacksent, r=3, g=2, b=4)


pairs(stacksent)

