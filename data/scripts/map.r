library(ggplot2)
library(maptools)
library(gpclib)
gpclibPermit()

options(scipen=10000)

a <- read.csv(file = '../raw/location_stats.txt', header=T, sep='\t')
 
world <- map_data("world")
data(wrld_simpl)
world <- fortify(wrld_simpl,region='NAME')

names(world) <- list("long","lat","order","hole","piece","group", "Country")
world$Country <- tolower(world$Country)
a$Country <- tolower(a$Country)
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
a$Country<- trim(a$Country)

choro <- merge(world, a, sort = FALSE, by = "Country")
choro <- choro[order(choro$order), ]
choro$cum_hits <- as.numeric(choro$cum_hits)

ggplot() + geom_polygon(aes(long,lat,group=group),data=world,fill='grey') +
geom_polygon(aes(long, lat, group = group, fill=cum_hits),data = choro) + 
theme_bw() +
scale_fill_gradient(name="Total HITs\nRequested",trans='log',low = "#D5DED9", high = "#0B486B", breaks=c(1e1,1e2,1e3,1e4,1e5,1e6)) +
xlab("") + ylab("") +
theme(legend.position = c(.1, .4),axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank())


ggsave("map.pdf", width=8.5, height=6)
