library(ggplot2)
library(scales)
data <- read.csv(file = '/Users/Djellel/Dropbox/repositories/mturk/data/raw/demand_supply.csv', header=T, sep=',')
attach(data)