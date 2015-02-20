library(ggplot2)
library(scales)
data <- read.csv(file = '/Users/Djellel/Dropbox/repositories/mturk/data/raw/category_trends.tsv', header=T, sep='\t')
attach(data)
# ggplot(data, aes(x=Time, col=factor(Strategy))) + stat_ecdf()                                     
ggplot(data, aes(y=count, x=tasktype, fill=factor(YEAR))) + 
geom_histogram(stat="identity", position="dodge", col="black") +  
scale_fill_brewer(name="Year") + ylab("Count (log)") + xlab("Task Category")  +
theme_bw() +
scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                   labels = trans_format("log10", math_format(10^.x))) +
theme(legend.position="top")
ggsave("/Users/Djellel/Dropbox/repositories/mturk/paper/figures/category_trends.pdf", width=9, height=4)