library(scales)
library(ggplot2)
data <- read.csv(file = '/Users/pirroh/exascale-mturk/data/raw/throughput_5cent_price_3months_final.txt', header=T, sep='\t')
data <- data[-sample(1:1915573, 1815573, replace=F), ]
attach(data)
p <- ggplot(data.frame(x=hits, y=throughput), aes(x = x, y = y)) +  
   geom_point(size=1,alpha=1/3, colour='#0072B2') + 
   # stat_smooth(fill="blue", size=1, alpha = 0.2, method = 'lm', aes(colour="stat_smooth(lm)")) +
   stat_function(fun = function(x) 0.05*x, geom='line',col="red") +
   coord_trans(xtrans = 'log10',ytrans = 'log10', limx = c(1,100000), limy =c(0.000001,10000)) +
   annotation_logticks(scaled=FALSE) + scale_colour_discrete("")+
   scale_x_continuous(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
   scale_y_continuous(breaks = trans_breaks("log10", function(x) 10^x),
                     labels = trans_format("log10", math_format(10^.x))) +
   xlab("HIT_available (log)") + ylab("Throughput HITs/Minute (log)") + 
   theme_bw() + theme(legend.position="none")
ggsave("motiv_mturk.pdf", width=6, height=4)
