library(ggplot2)
library(readr)

# Read in data ------------------------------------------------------------
## Get arguments from command line
## if NA, add default arguments

args <- commandArgs(trailingOnly = TRUE)
infile            <- ifelse(!is.na(args[1]), args[1], "skyscraper2.csv")
outfileBycity     <- ifelse(!is.na(args[2]), args[2], "skyscraper.fig.byCity.png")
outfileByAvgFloor <- ifelse(!is.na(args[3]), args[3], "skyscraper.fig.perFloor.png")

dat <- read_csv(infile)

# Figure 1 ----------------------------------------------------------------
ggplot(dat,
       aes(
         x = reorder(city, height_m, function(x){-max(x)}),
         y = height_m
       )) +
  geom_point() +
  xlab("") +
  ylab("Height (m)") +
  ggtitle("Tallest Completed Buildings by City") +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)
  )
ggsave(outfileBycity, width = 7, height = 6)


# Figure 2 ----------------------------------------------------------------
ggplot(dat, aes(x = reorder(building_name, rank),
                y = avg_floor_height_m,
                fill = rank)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_continuous(low = "yellow", high = "blue", guide = guide_legend(reverse=FALSE)) +
  xlab("") +
  ylab("Height (m)") +
  ggtitle("Average Floor Height of the 100 Tallest Completed Buildings") +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 5)
  )
ggsave(outfileByAvgFloor, width = 8, height = 4)

