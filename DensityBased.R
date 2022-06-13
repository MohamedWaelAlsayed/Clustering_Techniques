# Density-based clustering

#Importing libraries
library(dbscan)
library(fpc)
library(pch)

# data.2 data
data.2 <- read.csv("data 2.enc")
str(data.2)
D2<- data.2[,c(2,3)]
str(D2)

# Installing packages
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")
library(factoextra)

# Obtaining optimal eps value
kNNdistplot(D2, k=2)
abline(h = 0.45, lty=2)

# Density-based clustering with fpc & dbscan 
set.seed(25)

f <- fpc::dbscan(D2, eps=15, MinPts =5)
f
d <- dbscan::dbscan(D2, 15, 5)
d

# Cluster visualization
fviz_cluster(d, D2, geom = "point")

# Plotting Cluster
plot(d, D2[,1:2], main = "DBScan")
