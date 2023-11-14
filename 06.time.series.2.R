#time series analysisi

library(imageRy)
library(terra)

im.list()

#import the data

EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

#differenza tra le due images. 
dif = EN01[[1]] - EN13[[1]]

dev.off()

plot(dif) #grafico con la differenza tra le due immagini


#palette 
c1dif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=c1dif)

#blu: area che hanno continuato ad essere cosi


###new example: temperature in Greenland
g200 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("blue", "white", "red")) (100)
plot(g200, col=clg)

g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

plot(g2015, col=clg)

clg1 <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g200, col=clg1)

par(mfrow=c(2,1))
plot(g200, col=clg1)
plot(g2015, col=clg1)

#stacking the data
stackg <- c(g200, g2005, g2010, g2015)
plot(stackg, col=clg1)



#excercise: make the differences between the first and the final elements of the stack
dif = g2015[[1]] - g200[[1]]
dev.off()

plot(dif, col=clg1)
