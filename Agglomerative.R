# importing libraries
library(ggplot2)
library(cluster)
library(ggfortify)
library(stats)
library(dplyr)
library(factoextra)
#import data
data = read.csv("data 2.enc")
data = data[,c(2,3)]

#Agglomerative using hclust
d = dist(data, method = "euclidean")
#complete method
hcluster = hclust(d, method = "complete")
plot(hcluster)
group1 <- cutree(hcluster, k=2) # cut tree into 2 clusters
# draw dendogram with red borders around the 2 clusters
rect.hclust(hcluster, k=2, border=2:5)
table(group1)
#single method
hcluster = hclust(d, method = "single")
plot(hcluster)
#select best number of clusters(k)
fviz_nbclust(data, FUN = hcut, method = "silhouette")#2 clusters
#------------------------------------------------------------------

#Agglomerative using agnes
agh=agnes(data,method="complete")
agh$ac #look at the agglomerative coeffecient
group2 = cutree(as.hclust(agh), k = 2)
table(group2)
pltree(agh)
#Single method 
agh=agnes(data,method="single")
agh$ac
pltree(agh)