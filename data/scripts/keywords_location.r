library(ggplot2)
library(scales)
options(scipen=10000)
data <- read.csv(file = '/Users/Djellel/Dropbox/repositories/mturk/data/raw/location.tsv', header=T, sep='\t')
attach(data)                             
ggplot(data, aes(y=count, x=Keyword, fill=Requirement)) + 
geom_histogram(stat="identity", col="black") +  
facet_grid(. ~ Requirement) + 
scale_fill_brewer() + ylab("Count") + xlab("Keywords")  +
theme_bw() +
theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5))
ggsave("/Users/Djellel/Dropbox/repositories/mturk/paper/figures/keywords_location.pdf", width=9, height=4)