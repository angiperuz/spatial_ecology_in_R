library(terra)
library(imageRy)
library(ncdf4)
library(ggplot2)
library(viridis)

setwd("C:/Users/angel/Desktop/spatialecologyexam")

#data Marmolada are of 2016

b02_t1 <- rast("marmB02_t1.jpg")

b03_t1 <- rast("marmB03_t1.jpg")

b04_t1 <- rast("marmB04_t1.jpg")

b08_t1 <- rast("marmB08_t1.jpg")

b11_t1 <- rast("marmB11_t1.jpg")


#data Marmolada area of 2022

b02_t2 <- rast("marmB02_t2.jpg")

b03_t2 <- rast("marmB03_t2.jpg")

b04_t2 <- rast("marmB04_t2.jpg")

b08_t2 <- rast("marmB08_t2.jpg")

b11_t2 <- rast("marmB11_t2.jpg")



c1 <- colorRampPalette(c("lightgreen", "purple", "orange")) (500)
c2 <- colorRampPalette(c("blue", "yellow", "brown")) (500)
c3 <- colorRampPalette(c("#00FFFF", "#FF00FF", "#006400")) (500)



#plotting of 02, 03, 04 bands for t1 and t2

par(mfrow=c(2, 3))
plot(b02_t1, col = c1, main = "B02_t1")
plot(b03_t1, col = c2, main = "B03_t1")
plot(b04_t1, col = c3, main = "B04_t1")
plot(b02_t2, col = c1, main = "B02_t2")
plot(b03_t2, col = c2, main = "B03_t2")
plot(b04_t2, col = c3, main = "B04_t2")

dev.off()



#stacksent t1

stacksent_t1 <- c(b02_t1, b03_t1, b04_t1, b08_t1)
plot(stacksent_t1, col=viridisc)


#1=NIR, 2=RED, 3=GREEN
par(mfrow=c(2,2))
im.plotRGB(stacksent_t1, r=3, g=2, b=1)
im.plotRGB(stacksent_t1, r=4, g=3, b=2)
im.plotRGB(stacksent_t1, r=3, g=4, b=2)
im.plotRGB(stacksent_t1, r=3, g=2, b=4)


dev.off()


#stacksent t2

stacksent_t2 <- c(b02_t2, b03_t2, b04_t2, b08_t2)
plot(stacksent_t2, col=viridisc)


#1=NIR, 2=RED, 3=GREEN
par(mfrow=c(2,2))
im.plotRGB(stacksent_t2, r=3, g=2, b=1)
im.plotRGB(stacksent_t2, r=4, g=3, b=2)
im.plotRGB(stacksent_t2, r=3, g=4, b=2)
im.plotRGB(stacksent_t2, r=3, g=2, b=4)


dev.off()



#image stack of the two years with their true color:

true_16 <- im.plotRGB(stacksent_t1, r = 3, g = 2, b = 1)
true_22 <- im.plotRGB(stacksent_t2, r = 3, g = 2, b = 1)


#multiframe with 2016 and 2022 images

par(mfrow=c(1,2))
im.plotRGB(stacksent_t1, r=3, g=2, b=1)
im.plotRGB(stacksent_t2, r=3, g=2, b=1)


dev.off()


#index Normalized Difference Snow Index (NDSI)
#the formula used for this index is: 
#NDSI = (green - swir) / (green + swir)

#I have to disaggregate the images of B11 at t1 and t2, in order to change the b11 image in resolution and dimension 
b11_t2
b11_t1

ext(b11_t2) == ext(b11_t1)

b11_t1_scaled <- disagg(b11_t1, 2)

b11_t2_scaled <- disagg(b11_t2, 2)

SWIR_t1 <- b11_t1_scaled
SWIR_t2 <- b11_t2_scaled



##NDSI for 2016 data
NDSI_t1 = ((b03_t1 - SWIR_t1) / (b03_t1 + SWIR_t1))
NDSI_t1


##NDSI for 2022 data
NDSI_t2 = ((b03_t2 - SWIR_t2) / (b03_t2 + SWIR_t2))
NDSI_t2


par(mfrow=c(1, 2))
plot(NDSI_t1, col=viridisc, main = "NDSI (t1)")
plot(NDSI_t2, col=viridisc, main = "NDSI (t2)")

dev.off()


#difference between the two years
difference <- NDSI_t1 - NDSI_t2
plot(difference, col=viridisc, main = "NDSI Difference (t1-t2) ")


#histograms of the snow frequency
par(mfrow=c(1, 3))
hist(NDSI_t1, col= c("coral1"), main= "Snow frequency at t1", xlab = "NDSI")
hist(NDSI_t2, col= c("deepskyblue"), main= "Snow frequency at t2", xlab = "NDSI")
hist(difference, main = "Differences in Snow coverage t1-t2", col="darkorchid",  xlab = "NDSI Difference")

dev.off()



#creation of 2 clusters to better visualise the snow at t1 and t2
c_t1 <- im.classify(NDSI_t1, num_clusters = 2)

c_t2 <- im.classify(NDSI_t2, num_clusters = 2)

colclu <- colorRampPalette(c("white", "darkgoldenrod4")) (100)



par(mfrow=c(1,2))
plot(c_t1, col=colclu, main = "Presence of snow (1) and no snow (2) at t1")
plot(c_t2, col=colclu, main = "Presence of snow (1) and no snow (2) at t2")


dev.off()


#Calculate the percentages for the 2 clusters at t1 and t2
#t1
ft1 <- freq(c_t1)
tott1 <- ncell(c_t1)
pt1 <- ft1 * 100 / tott1
pt1 
#the results are 26.15 (snow presence) and 73.85 (snow absence)


#t2
ft2 <- freq(c_t2)
tott2 <- ncell(c_t2)
pt2 <- ft2 * 100 / tott2
pt2
#the results are 15.60 (snow presence) and 84.40 (snow absence)



# Bulding graph with the results

class <- c("SNOW", "NO SNOW")
t1_2016 <- c(26.15, 73.85)
t2_2022 <- c(15.60, 84.40)

tabout <- data.frame(class, t1_2016, t2_2022)


p1 <- ggplot(tabout, aes(x=class, y=t1_2016, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=t2_2022, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
plot(p1)
plot(p2)

dev.off()




#index Normalized Difference Vegetation Index (NDVI)
#the formula used for this index is
#NDVI = (nir - red) / (nir + red)


##NDVI for 2016 data
NDVI_t1 = ((b08_t1 - b04_t1) / (b08_t1 + b04_t1))
NDVI_t1

##NDVI for 2022 data
NDVI_t2 = ((b08_t2 - b04_t2) / (b08_t2 + b04_t2))
NDVI_t2


par(mfrow=c(1, 2))
plot(NDVI_t1, main = "NDVI (t1)")
plot(NDVI_t2, main = "NDVI (t2)")



#visualisation of NSDI e NDVI together for t1 and t2
par(mfrow=c(2, 2))
plot(NDSI_t1, col=viridisc, main = "NDSI (t1)")
plot(NDSI_t2, col=viridisc, main = "NDSI (t2)")
plot(NDVI_t1, main = "NDVI (t1)")
plot(NDVI_t2, main = "NDVI (t2)")


#create 2 clusters to better visualise difference in vegetation cover at t1 and t2
v_t1 <- im.classify(NDVI_t1, num_clusters = 2)

v_t2 <- im.classify(NDVI_t2, num_clusters = 2)

colclu <- colorRampPalette(c("darkgreen", "lightgreen")) (100)

par(mfrow=c(1,2))
plot(v_t1, col=colclu, main = "NDVI using two clusters at t1")
plot(v_t2, col=colclu, main = "NDVI using two clusters at t2")


dev.off()



#calculate the variability 
#3x3 pixels moving window for NDVI

#the function focal() computes standard deviation of values of pixels in a window 3x3
#for each position in the raster 

sd16_3 <- focal(NDVI_t1, matrix(1/9, 3, 3), fun=sd)
sd22_3 <- focal(NDVI_t2, matrix(1/9, 3, 3), fun=sd)

par(mfrow=c(1,2))
plot(sd16_3, main = "NDVI_t1 (3x3)")
plot(sd22_3, main = "NDVI_t2 (3x3)")

dev.off()
