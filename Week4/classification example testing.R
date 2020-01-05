install.packages("KODAMA")
#a quick classification example
x1 <- c(rnorm(20, mean=1), rnorm(20, mean=5))
x2 <- c(rnorm(20, mean=5), rnorm(20, mean=1))
y=rep(1:2,each=20)
x <- cbind(x1,x2)
train <- sample(1:40, 30)
#plot the training cases
plot(x1[train], x2[train], col=y[train]+1)
