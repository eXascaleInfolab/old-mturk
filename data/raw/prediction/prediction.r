library(ggplot2)
library(reshape2)
library(splines)
library(MASS)
data <- read.csv(file = '/Users/xi/repositories/exascale-mturk/data/raw/prediction/old.txt', header=T, sep=' ')
m <- as.matrix(data)
m[m<=0] <- 0.0001
data <- as.data.frame(m)
ggplot(data,  aes(x=actual,y=predicted)) + geom_point(colour = '#0072B2', alpha = I(1/5),size=1.5) +
  stat_smooth(colour="orangered1", size=1, level=0.99, method = "lm", formula = y ~ ns(x,3)) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                   labels = trans_format("log10", math_format(10^.x)),limits=c(1, 5000)) +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                   labels = trans_format("log10", math_format(10^.x)),limits=c(1, 5000))+
  theme_bw() + annotation_logticks() +
  theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5)) +
  ylab("Predicted Throughput (log)") +
  xlab("Actual Throughput (log)")

ggsave("cool.pdf", width=5.5, height=5)

