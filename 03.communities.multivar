#Multivariate analysis
library(vegan)

#we have to recall the data
data(dune)

dune

#number of individuals for each plot. 
#function head: solo le prime righe (first six rows of the data). DCA: detrended correspondence

decorana(dune)
ord <- decorana(dune)
ord

#the information of our intrest is the length of the axis.
ldc1 <- 3.7004
ldc2 <- 3.1166
ldc3 <- 1.30055
ldc4 <- 1.47888

total = ldc1 + ldc2 + ldc3 + ldc4
total

pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
pldc3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

pldc1
pldc2
pldc3
pldc4


#how much of the comulative percentage the first 2 cover 

plot(ord)
