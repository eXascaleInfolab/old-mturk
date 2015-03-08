library(ggplot2)
library(reshape2)
require(scales)
data <- read.csv(file = '../raw/batch_size.txt', header=T, sep='\t')
attach(data) 
options(scipen=10000)
data <- melt(data, id.vars = "date") 
data$date <- strptime(data$date,"%Y-%m-%d")                           
ggplot(data = data, aes(x = date, y = value, fill=variable)) + 
geom_histogram(stat="identity") + facet_grid(variable ~ ., scales="free_y") +
scale_fill_brewer() + ylab("Count") + xlab("Year")  +
theme_bw() +
theme(legend.position="none")
#stat_smooth() 
ggsave("../../paper/figures/batch_size.pdf", width=6, height=4)



#data <-read.csv('/Users/xi/repositories/exascale-mturk/data/raw/all_batch_sizes.tsv', header=T, sep='\t')
#attach(data) 
#options(scipen=10000)
#data$date <- strptime(data$date,"%d-%m-%Y")   

#ggplot(data, aes(x=date, y=hits_available)) + 
#geom_point() +  geom_boxplot(aes(group=date)) +
#scale_y_log10() +
#stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE)



#ggplot(data, aes(x=date, y=hits_available)) + 
#geom_point() +  geom_boxplot(aes(group=date)) +
#scale_y_log10() +
#stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE)


#ggplot(data, aes(x=date, y=hits_available)) + 
#stat_summary(fun.y=max, colour="darkred", geom="line", shape=18, size=3,show_guide = FALSE) +
#stat_summary(fun.y=mean, colour="darkblue", geom="point", shape=15, size=3,show_guide = FALSE)
