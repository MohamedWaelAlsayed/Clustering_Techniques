library(tidyverse)
library(cluster)
library(factoextra)
library(mclust)
library(ggfortify)
library(stats)
library(dplyr)

data = read.csv("data 2.enc")

view(data)

data = data[c(2,3)]

sample_data = data[1:15,]

dh = diana(sample_data)

dh$dc

pltree(dh)