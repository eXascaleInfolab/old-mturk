library(ggplot2)
library(reshape2)
data <- read.csv(file = '/Users/Djellel/Dropbox/repositories/mturk/data/raw/importances.csv', header=T, sep=',')
attach(data)          
data <- melt(data, id.vars = "X")  

# if max is 360
rnd15 <- function(x) round(x/15)

# Feature importances
ggplot(data, aes(x = X, y = value, fill=variable)) + 
geom_histogram(stat="identity") + facet_wrap(~ variable, ncol=4, scales="free_y") +
scale_colour_brewer(palette="Set1")+ ylab("Importance %") + xlab("Time Delta Considered (Hours)")  +
theme_bw() + scale_y_continuous(labels = percent) + scale_x_continuous(labels = rnd15) +
theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5)) + stat_smooth()

ggsave("/Users/Djellel/Dropbox/repositories/mturk/paper/figures/importances.pdf", width=8, height=10)