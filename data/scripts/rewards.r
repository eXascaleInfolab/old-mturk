library(ggplot2)
library(scales)
data <- read.csv(file = '../raw/reward_year.tsv', header=T, sep='\t')
attach(data)
subdf <- subset(data, reward < 0.1)                               
ggplot(subdf, aes(y=count, x=date_part, fill=factor(reward))) + 
geom_histogram(stat="identity", position="dodge", col="black") +  
scale_fill_brewer(name="Micro Reward (USD)") + ylab("Count") + xlab("Year")  +
theme_bw() +
theme(legend.position="top")
ggsave("../../paper/figures/reward_year.pdf", width=6, height=3)