library(ggplot2)
library(reshape2)
library(scales)
data <- read.csv(file = '/Users/pirroh/exascale-mturk/data/raw/powerlaw.csv', header=T, sep=',')
attach(data)          

ggplot(data, aes(x = batch_size, y = instances, fill=year)) +
  geom_point(alpha=1/3, colour='blue') +
  facet_wrap(~ year, ncol=2, scales="fixed") +
  scale_colour_brewer(palette="Set1") +
  ylab("# of Batches") +
  xlab("Batch Size") +
  scale_x_log10() +
  scale_y_log10() +
  theme_bw() +
  theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5))

ggsave("/Users/pirroh/exascale-mturk/paper/figures/powerlaw.pdf", width=7, height=8)

