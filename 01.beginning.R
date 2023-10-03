#here I can write anything I want. 

#R is a calculator
2+3

#Assign to an object
zima <- 2+3
zima


duccio <- 5+3
duccio

zima*duccio
final <- zima*duccio
final

final^2

#array
sophi <- c(10, 20, 30, 50, 70) # microplastics. numbers are called arguments. functions have parenthesis and inside them there are arguments

paula <- c(100, 500, 600, 1000, 2000) #people

#now we can make a plot with the two arrays

plot(paula, sophi)
#a plot of all the data to demonstrate that plastic is due to humans


#how can I put a new label 
plot(paula, sophi, xlab="number of paoula", ylab="microplastics")

people <- paula
microplastics <- sophi

plot(people, microplastics)

#pch
plot(people, microplastics, pch=19)

#character exageration
plot(people, microplastics, pch=19, cex=2)

#we can also change the colors
plot(people, microplastics, pch=19, cex=2, col="blue")










     
