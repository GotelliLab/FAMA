# --------------------------------------
# Read in Primack non-natives data set
# Common and rare species are paired
# and museum record counts tallied for each
# 24 Apr 2020
# NJG
# --------------------------------------
#
library(ggplot2)
# set up data frame
df <- read.table(file="FormattedData/x_primack_concord_nonnatives.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)
# boxplot and ANOVA with full Eaton rankings
model_1 <- aov(data=df,Herbarium.Specimens~Abundance.Rank)
summary(model_1)


model_2 <- aov(data=df,Herbarium.Specimens~Abundance.Rank+ Group)
summary(model_2)

model_2a <- lm(data=df,Herbarium.Specimens~Abundance.Rank+ Group)
summary(model_2a)

model_2b <- lm(data=df,Herbarium.Specimens~Abundance.Rank)
summary(model_2b)

figure_1 <- ggplot(data=df,aes(x=Abundance.Rank,
                               y=Herbarium.Specimens)) +
geom_boxplot() +
  geom_point(size=2) +
geom_point(size=4,shape=21,
           color="black",fill="grey70") +
   geom_jitter(width=0.07,size=4,shape=21,
               color="black",fill="grey70") +
  xlab("Abundance Class") +
  ylab("Museum Records") + 
  guides(fill=FALSE) +
  theme_bw(base_size=20)

print(figure_1)
ggsave(plot=figure_1, filename="Output/x_ConcordNonNatives.pdf",width=11,height=8.55,units="in",device="pdf") 
ggsave(plot=figure_1, filename="Output/x_ConcordNonNatives.jpeg",width=11,height=8.55,units="in",device="jpeg") 


