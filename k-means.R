install.packages("factoextra")
install.packages("ggplot2")
install.packages("ggfortify")

# Loading package
library(factoextra)
library(ggfortify)
library(ggplot2)
library(dplyr)
library(cluster)
df<-read.csv("data 2.enc") #read the data
df  #View the data
d= select(df,c(2,3))
d
#function to compute average silhouette for k clusters
fviz_nbclust(d, kmeans, method = "silhouette")

# Fitting K-Means clustering Model
kms=kmeans(d,2)
kms

#the centers of clusters
kms$centers
# Cluster identification for each observation
kms$cluster

# Visualizing clusters

autoplot(kms,d,frame=T)
clusplot(d,kms$cluster ,color=T,shade=T)
#plot results of final k-means model
fviz_cluster(kms, data = d)
