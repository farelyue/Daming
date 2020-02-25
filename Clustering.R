#Praktikum 6

#Install Package
library(cluster) #PAM
install.packages("fpc")
library(fpc) #PAMK

View(iris)
iris2 <- iris
iris2$Species <- NULL

#1. Kmeans Clustering
set.seed(8)
kmeans_clust <- kmeans(iris2, 3)

table(iris$Species, kmeans_clust$cluster) 
#Kluster 1 : kelompok dengan dua spesies yang berbeda
#Kluster 2 : kelompok yang didominasi oleh spesies virginica
#Kluster 3 : kelompok hanya berisi spesies setosa

plot(x = iris2$Sepal.Length, 
     y = iris2$Sepal.Width, 
     col = kmeans_clust$cluster,
     main = "Plot K-means Cluster (K=3)",
     xlab = "Sepal Length",
     ylab = "Sepal Width")

points(kmeans_clust$centers[,c("Sepal.Length", "Sepal.Width")],
       col = 1:3,
       pch = 8,
       cex = 2)

#2. KMedoid Clustering

#PAM
set.seed(8)
pam_clust <- pam(iris2, 3)

table(iris$Species, pam_clust$clustering)

plot(x = iris2$Sepal.Length, 
     y = iris2$Sepal.Width,
     col = pam_clust$clustering,
     main = "Plot PAM Cluster (K=3)",
     xlab = "Sepal Length",
     ylab = "Sepal Width")

points(pam_clust$medoids[,c("Sepal.Length", "Sepal.Width")],
       col = 1:3,
       pch = 8,
       cex = 2)

par(mfrow = c(1,2))
plot(pam_clust)

#PAMK
set.seed(8)
pamk_clust <- pamk(iris2)
pamk_clust$pamobject$medoids

table(iris$Species, pamk_clust$pamobject$clustering)

plot(x = iris2$Sepal.Length, 
     y = iris2$Sepal.Width,
     col = pamk_clust$pamobject$clustering,
     main = "Plot PAMK Cluster",
     xlab = "Sepal Length",
     ylab = "Sepal Width")

points(pamk_clust$pamobject$medoids[,c("Sepal.Length", "Sepal.Width")],
       col = 1:3,
       pch = 8,
       cex = 2)

par(mfrow = c(1,2))
plot(pamk_clust$pamobject)

#3. Hierarchical Clustering
set.seed(8)
hirarki_clust <- hclust(dist(iris2[1:40,]), method = "ave")
?hclust
layout(matrix(1))
plot(hirarki_clust, hang = -1, label = iris$Species[1:40])
