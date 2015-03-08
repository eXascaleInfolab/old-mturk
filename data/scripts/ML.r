library(ggplot2)
data <-read.csv('../raw/ML.tsv', header=T, sep='\t')
attach(data)

# Accuracy
ggplot(data, aes(x=Frame, y=Accuracy, group =1, fill=factor(Frame))) + 
geom_point(size=1)+ scale_y_continuous(limits = c(-1,1)) + 
geom_boxplot(aes(group=Frame),outlier.shape=NA) + stat_smooth() +
scale_fill_hue(h=c(0, 180)) + ylab("Score (-1,1]") + xlab("Time Delta Considered (Hours)")  +
theme_bw() +
theme(legend.position="none") +
stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE)
ggsave("../../paper/figures/ML_accuracy.pdf", width=8, height=6)

# MAE
ggplot(data, aes(x=Frame, y=MAE)) + 
geom_point(size=1)+ scale_y_continuous(limits = c(0,10)) + 
geom_boxplot(aes(group=Frame),outlier.shape=NA) + stat_smooth() +
stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE)

# MSE
ggplot(data, aes(x=Frame, y=MSE)) + 
geom_point(size=1)+ scale_y_continuous(limits = c(0,1000)) + 
geom_boxplot(aes(group=Frame),outlier.shape=NA) + stat_smooth()


