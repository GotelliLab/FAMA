# --------------------------------------
# Read in Primack Concord data
# Compiled from notebooks from Primack
# IMG_6197.JPG and IMG_6198.JPG
# 22 Apr 2020
# NJG
# --------------------------------------
#
library(ggplot2)
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
# boxplot and ANOVA with full Eaton rankings
model_1 <- aov(data=df,Herbarium.Specimens~Abundance.Rank)
summary(model_1)
model_1r <- lm(data=df,Herbarium.Specimens~Abundance.Rank)
summary(model_1r)


figure_1 <- ggplot(data=df,aes(x=Abundance.Rank,
                               y=Herbarium.Specimens)) +
geom_boxplot(fill=I("wheat")) +
geom_point(size=4,shape=21,
           color="grey70",fill="grey70") +
  geom_jitter(width=0.2,size=4,
              color="grey70",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Herbarium Specimens") + 
  theme_bw(base_size=20)

print(figure_1)
ggsave(plot=figure_1, filename="Output/x_ConcordTreesFull.pdf",width=11,height=8.55,units="in",device="pdf") 
ggsave(plot=figure_1, filename="Output/x_ConcordTreesFull.jpeg",width=11,height=8.55,units="in",device="jpeg") 


# boxplot and ANOVA with collapsed Primack rankings
model_1 <- aov(data=df,Herbarium.Specimens~Simple.Rank)
summary(model_1)
model_1r <- lm(data=df,Herbarium.Specimens~Simple.Rank)
summary(model_1r)


figure_2 <- ggplot(data=df,aes(x=Simple.Rank,
                               y=Herbarium.Specimens)) +
geom_boxplot() +
geom_point(size=4,shape=21,
           color="black",fill="grey70") +
  geom_jitter(width=0.2,size=4,shape=21,
              color="black",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Museum Records") + 
  theme_bw(base_size=20)

print(figure_2)
ggsave(plot=figure_2, filename="Output/x_ConcordTreesSimple.pdf",width=11,height=8.55,units="in",device="pdf") 
ggsave(plot=figure_2, filename="Output/x_ConcordTreesSimple.jpeg",width=11,height=8.55,units="in",device="jpeg") 