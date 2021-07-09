# --------------------------------------
# final plot of plant data sets
# 29 Aug 2020
# NJG
# --------------------------------------
library(tidyverse)
library(logger)
source("Scripts/BetaDirFunctions.R")
#  Solidago ------------------
# set up data frame
df <- read.table(file="FormattedData/x_primack_middlesex_solidago.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)
# reorder groups
df$Abundance.Rank <- factor(df$Abundance.Rank,
                            levels = c('Abundant',
                                       'Very Common',
                                       'Common',
                                       'Uncommon',
                                       'Infrequent',
                                       'Rare',
                                       'Probably Extinct'),
                            ordered = TRUE)

p1 <- ggplot(data=df,aes(x=Simple.Rank,
                               y=Herbarium.Specimens)) +
  geom_boxplot() +
  geom_point(size=4,shape=21, alpha=0.5,
             color="black",fill="grey70") +
  geom_jitter(width=0.2,size=4,shape=21, alpha=0.5,
              color="black",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Museum Records") + 
  theme_bw(base_size=20)
p1 <- p1 + labs(title="a. Walden Pond Solidago") +
  theme(plot.title = element_text(size=10))


# Ericaceae ------------------
# set up data frame
df <- read.table(file="FormattedData/x_primack_concord_ericacea.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)
# reorder groups
df$Abundance.Rank <- factor(df$Abundance.Rank,
                            levels = c('Abundant',
                                       'Very Common',
                                       'Common',
                                       'Uncommon',
                                       'Infrequent',
                                       'Rare',
                                       'Probably Extinct'),
                            ordered = TRUE)

p2 <- ggplot(data=df,aes(x=Simple.Rank,
                               y=Herbarium.Specimens)) +
  geom_boxplot() +
  geom_point(size=4,shape=21, alpha=0.5,
             color="black",fill="grey70") +
  geom_jitter(width=0.2,size=4,shape=21, alpha=0.5,
              color="black",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Museum Records") + 
  theme_bw(base_size=20)
p2 <- p2 + labs(title="b. Walden Pond Ericaceae") +
  theme(plot.title = element_text(size=10))

# Invasive species ------------------
# set up data frame
df <- read.table(file="FormattedData/x_primack_concord_nonnatives.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

p3 <- ggplot(data=df,aes(x=Abundance.Rank,
                               y=Herbarium.Specimens)) +
  geom_boxplot() +
  geom_point(size=2) +
  geom_point(size=4,shape=21, alpha=0.5,
             color="black",fill="grey70") +
  geom_jitter(width=0.2,size=4,shape=21, alpha=0.5,
              color="black",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Museum Records") + 
  guides(fill=FALSE) +
  theme_bw(base_size=20)
p3 <- p3 + labs(title="c. Walden Pond non-natives") +
  theme(plot.title = element_text(size=10))


# trees ----------------
# set up data frame
df <- read.table(file="FormattedData/x_primack_concord_trees.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)
# reorder groups
df$Abundance.Rank <- factor(df$Abundance.Rank,
                            levels = c('Abundant',
                                       'Common',
                                       'Frequent',
                                       'Occasional',
                                       'Uncommon',
                                       'Infrequent',
                                       'Scarce',
                                       'Rare'),
                            ordered = TRUE)
p4 <- ggplot(data=df,aes(x=Simple.Rank,
                               y=Herbarium.Specimens)) +
  geom_boxplot() +
  geom_point(size=4,shape=21, alpha=0.5,
             color="black",fill="grey70") +
  geom_jitter(width=0.2,size=4,shape=21, alpha=0.5,
              color="black",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Museum Records") + 
  theme_bw(base_size=20)
p4 <- p4 + labs(title="d. Walden Pond trees") +
  theme(plot.title = element_text(size=10))


p5 <- fig_gen("DataObjects/primack_trees_ma")
p5 <- p5 + labs(title="e. Massachusetts trees (plot data)") +
  theme(plot.title = element_text(size=10))


plant_panel <- (p1 + p2) / (p3 + p4) / (p5)
print(plant_panel)
ggsave(plot=plant_panel, filename=("Output/Figure_4.pdf"),width=8.5,height=11,units="in",device="pdf")  
ggsave(plot=plant_panel, filename=("Output/Figure_4.jpeg"),width=8.5,height=11,units="in",device="jpeg")
ggsave(plot=plant_panel, filename=("Output/Figure_4.tiff"),width=8.5,height=11,units="in",device="tiff",dpi=600)