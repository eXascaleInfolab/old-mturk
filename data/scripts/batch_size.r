library(ggplot2)
library(reshape2)
require(scales)
data <- read.csv(file = '/Users/Djellel/Dropbox/repositories/mturk/data/raw/batch_size.txt', header=T, sep='\t')
attach(data) 
options(scipen=10000)
data <- melt(data, id.vars = "date") 
data$date <- strptime(data$date,"%Y-%m-%d")                           
ggplot(data = data, aes(x = date, y = value, fill=variable)) + 
geom_histogram(stat="identity") + facet_grid(variable ~ ., scales="free_y") +
scale_fill_brewer() + ylab("Count") + xlab("Year")  +
theme_bw() +
theme(legend.position="none") +
stat_smooth() 
ggsave("/Users/Djellel/Dropbox/repositories/mturk/paper/figures/batch_size.pdf", width=9, height=5.5)