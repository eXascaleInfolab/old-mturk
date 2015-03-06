library(ggplot2)
library(reshape2)
library(scales)
library(MASS)
data <- read.csv(file = '/Users/xi/repositories/exascale-mturk/data/raw/powerlaw.csv', header=T, sep=',')
attach(data)          

ggplot(data, aes(x = batch_size, y = instances)) +
  geom_point(alpha=1/3, colour='#0072B2') +
  scale_colour_brewer() +
  ylab("Number of Batches (log)") +
  xlab("Batch Size (log)") +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                   labels = trans_format("log10", math_format(10^.x))) +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                   labels = trans_format("log10", math_format(10^.x)))+
  theme_bw() + annotation_logticks() +
  theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5)) +
# stat_smooth(method=lm)

ggsave("/Users/xi/repositories/exascale-mturk/paper/figures/powerlaw.pdf", width=6, height=4)

