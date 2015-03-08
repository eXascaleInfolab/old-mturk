library(ggplot2)
library(reshape2)
library(scales)
data <- read.csv(file = '/Users/xi/repositories/exascale-mturk/data/raw/importances.csv', header=T, sep=',')
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
data$requester_id <- NULL
data$leftminutes <- NULL
attach(data)          
data <- melt(data, id.vars = "X")

# if max is 360
rnd15 <- function(x) round(x/15)
data$FRAME <- rnd15(X)

# Feature importances
ggplot(data, aes(x = FRAME, y = value, fill=variable)) +
geom_point(size=1) +
geom_boxplot(aes(group=FRAME),outlier.shape=NA) + 
facet_wrap(~ variable, ncol=2, scales="fixed") +
scale_colour_brewer(palette="Set1") +
ylab("Feature Importance %") +
xlab("Time Delta Considered (Hours)") +
scale_y_continuous(labels = percent) +
theme_bw() +
theme(legend.position="none", axis.text.x = element_text(angle = 90, hjust = 1, vjust =0.5)) +
stat_smooth()

ggsave("../../paper/figures/importances.pdf", width=6, height=4)
