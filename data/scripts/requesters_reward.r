library(ggplot2)
library(reshape2)
data <- read.csv(file = '../raw/new_requesters_file.txt', header=T, sep='\t')
attach(data) 
data <- melt(data, id.vars = "date") 
data$date <- strptime(data$date,"%Y-%m-%d")                           
ggplot(data = data, aes(x = date, y = value, fill=variable)) + 
geom_histogram(stat="identity") + facet_grid(variable ~ ., scales="free_y") +
scale_fill_brewer() + ylab("Count") + xlab("Year")  +
theme_bw() +
theme(legend.position="none") 
#stat_smooth()
ggsave("../../paper/figures/requesters_reward.pdf", width=6, height=4)
