# K-means and clustering
#=======================#

#library(fpc)  - Required for clusterplot
#library(ggvis) - required for visualization

#zoo data
datazoo <- read.csv('C:/Users/Administrator/Documents/MSDatascience/IST707/Week4/zoo.csv')
datazoocleaned <- datazoo[, 2:18]

# Run k-means three times with a different centroid each time. 
set.seed(1)
k1 <- kmeans(datazoocleaned, 3)
plotcluster(datazoocleaned, k1$cluster)

# Calculate the SSE per number of clusters
wss = kmeans(datazoocleaned, centers = 1)$tot.withinss
for(i in 2:17){
  wss[i] = kmeans(datazoocleaned, centers = i)$tot.withinss
}
sse = data.frame(c(1:17), c(wss))
colnames(sse) <- c('Clusters', 'SSE')

# Visualize the 'elbow' plot to maximize # of clusters while minimizing SSE 
sse %>% ggvis(~Clusters, ~SSE) %>% layer_points(fill := 'red') %>% layer_lines()

# Create cluster and plot. 
k2 <- kmeans(datazoocleaned, 9)
clusplot(datazoocleaned, k1$cluster, color = T, shade = F, labels = 0, lines = 0)

