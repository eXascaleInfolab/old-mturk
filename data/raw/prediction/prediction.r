library(ggplot2)
library(reshape2)
data <- read.csv(file = 'data.txt', header=T, sep=' ')
ggplot(data, aes(x=actual,y=predicted)) + geom_point(alpha = I(1/3),size=1) + scale_y_log10() + scale_x_log10()
