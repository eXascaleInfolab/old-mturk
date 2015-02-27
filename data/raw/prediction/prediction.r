library(ggplot2)
library(reshape2)
library(splines)
library(MASS)
data <- read.csv(file = '/Users/pirroh/exascale-mturk/data/raw/prediction/old.txt', header=T, sep=' ')
m <- as.matrix(data)
m[m<=0] <- 0.0001
data <- as.data.frame(m)
ggplot(data,  aes(x=actual,y=predicted)) + geom_point(colour = "lightblue", alpha = I(1/5),size=1.5) +
  scale_y_log10(limits=c(1, 5000)) + scale_x_log10(limits=c(1, 5000)) + theme_bw() +
  stat_smooth(colour="orangered1", size=1, level=0.99, method = "lm", formula = y ~ ns(x,3))
  
ggsave("cool.pdf", width=5.5, height=5)

