#measurement of RS based variability
library(imageRy)
library(terra)
library(viridis)

im.list()
sent <- im.import("sentinel.png")


# band 1 = NIR
# band 1 = red
# band 1 = green

im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)

#variability can be calculated only on one variable: now we have 3 variables available. 

nir <- sent[[1]]
plot(nir)
#green is vegetation. 

#moving window. standard deviation in that particolar window. then the window moves. and we calculate the sd of the new window



#focal function - any type of calculation

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd) #function is the standard deviation
plot(sd3)

viridisc <- colorRampPalette(viridis(7))(255)
plot(sd3, col=viridisc)
