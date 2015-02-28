library(ggplot2)
library(reshape2)
library(scales)
data <- read.csv(file = '/Users/pirroh/exascale-mturk/data/raw/importances.csv', header=T, sep=',')
data$title <- NULL
data$description <- NULL
data$keywords <- NULL
data$time_alloted <- NULL
data$reward <- NULL
data$totalapproved <- NULL
data$tasktype <- NULL
data$start_time <- NULL
data$hitsAvailableUI <- NULL
data$diffHitsUI <- NULL
data$hitGroupsAvailableUI <- NULL
data$diffGroupsUI <- NULL
data$master <- NULL
data$diffGroups <- NULL
data$rewardsArrived <- NULL
data$hitsCompleted <- NULL
data$percHitsCompleted <- NULL
data$location <- NULL
data$diffRewards <- NULL
data$rewardsCompleted <- NULL
data$percHitsPosted <- NULL
data$diffHits <- NULL
data$hitsArrived <- NULL
data$approvalrate <- NULL
attach(data)          
data <- melt(data, id.vars = "X")  

# if max is 360
rnd15 <- function(x) round(x/15)

# Feature importances
ggplot(data, aes(x = X, y = value, fill=variable)) + 
geom_histogram(stat="identity") + facet_wrap(~ variable, ncol=2, scales="fixed") +
scale_colour_brewer(palette="Set1")+ ylab("Importance %") + xlab("Time Delta Considered (Hours)")  +
theme_bw() + scale_y_continuous(labels = percent) + scale_x_continuous(labels = rnd15) +
theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5)) + stat_smooth()

ggsave("/Users/pirroh/exascale-mturk/paper/figures/importances.pdf", width=8, height=6)