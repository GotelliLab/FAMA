# Dirichlet comparisons of museum and berlese samples to validate the analysis
# of SADs with museum records. This uses a curated data set provided by
# Doug Boucher
# NJG
# 13 December 2019

# -------------------------------------------------------------------------


# Preliminaries -----------------------------------------------------------

library(tidyverse)
library(gtools)                        # for the dirichlet sampler
library(patchwork)
source("Scripts/BetaDirFunctions.R")   # get dirch function
set.seed(100)

# Load Data ---------------------------------------------------------------

load("DataObjects/GotelliTestDataset_v1.Rda")
str(GotelliTestDataset_v1)

# Create Dirichlet Data Frames --------------------------------------------


# extract counts of berlese, museum specimens
. <- table(GotelliTestDataset_v1$Species,GotelliTestDataset_v1$MuseumBerlese)

# construct dirichlet statistics
berlese_sad <- dirch_stats(.[,1])
head(berlese_sad)
museum_sad <- dirch_stats(.[,2])
head(museum_sad)

# rename columns
names(berlese_sad) <- paste("ber_",names(berlese_sad),sep="")
head(berlese_sad)
names(museum_sad) <- paste("mus_",names(museum_sad),sep="")
head(museum_sad)

# merge data serts for graphing
df <- cbind(museum_sad,berlese_sad)
names(df)


# Simple Statistics -------------------------------------------------------

# correlation of museum and berlese raw counts, proportions, dirichlet estimates
summary(lm(df$mus_counts~df$ber_counts))
summary(lm(df$mus_freq_mean~df$ber_freq_mean))
summary(lm(df$mus_bayes_mean~df$ber_bayes_mean))

# weighted regression analysis with sample size weights
summary(lm(df$mus_bayes_mean~df$ber_bayes_mean,
           weights=df$mus_counts+df$ber_counts))

# log10 transformation to reduce influential points
summary(lm(log10(df$mus_bayes_mean)~log10(df$ber_bayes_mean),
           weights=df$mus_counts+df$ber_counts))

# regression analysis with and without sample size weights
# test null hypothesis that slope = 1
# see https://stackoverflow.com/questions/33060601/test-if-the-slope-in-simple-linear-regression-equals-to-a-given-constant-in-r
summary(lm(df$mus_bayes_mean~df$ber_bayes_mean + offset(1 * df$ber_bayes_mean),
           weights=df$mus_counts+df$ber_counts))
summary(lm(df$mus_bayes_mean~df$ber_bayes_mean + offset(1 * df$ber_bayes_mean)))
        
# reduced data set for only species that occur in both data sets
df_pres <- df[which(df$mus_counts > 0 & df$ber_counts > 0),]
summary(lm(log10(df_pres$mus_bayes_mean)~log10(df_pres$ber_bayes_mean),
           weights=df_pres$mus_counts+df_pres$ber_counts))
summary(lm(df_pres$mus_bayes_mean~df_pres$ber_bayes_mean + offset(1 * df_pres$ber_bayes_mean),
           weights=df_pres$mus_counts+df_pres$ber_counts))
summary(lm(df_pres$mus_bayes_mean~df_pres$ber_bayes_mean + offset(1 * df_pres$ber_bayes_mean)))


# chi square test on raw counts
chisq.test(table(GotelliTestDataset_v1$Species,
                 GotelliTestDataset_v1$MuseumBerlese, useNA="no"))


# Figure -----------------------------------------------------------------
Figure1 <- ggplot(data=df,aes(x=ber_bayes_mean,y=mus_bayes_mean)) +
                 geom_point() +
  geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
                 # scale_y_log10() +
  geom_abline(slope=1, intercept=0,linetype="dashed") +
  xlab("Berlese Relative Abundance") +
  ylab("Museum RA") +
  theme_bw(base_size=25)
                 # scale_x_log10() 
  # geom_segment(aes(x=ber_bayes_low, y=mus_bayes_mean,
  #                  xend=ber_bayes_high,yend=mus_bayes_mean))  
  # geom_segment(aes(x=ber_bayes_mean, y=mus_bayes_low,
  #                  xend=ber_bayes_mean,yend=mus_bayes_high))  
print(Figure1)

Figure2 <- ggplot(data=df,aes(x=ber_bayes_mean,y=mus_bayes_mean)) +
  # geom_segment(aes(x=ber_bayes_mean, y=mus_bayes_low,
  #                  xend=ber_bayes_mean,yend=mus_bayes_high))  +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 1) +
  geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
  scale_y_log10() +
  geom_abline(slope=1, intercept=0,linetype="dashed") +
  scale_x_log10()+ 
  xlab("Berlese Relative Abundance") +
  ylab("Museum RA") +
  theme_bw(base_size=25)
  
  # geom_segment(aes(x=ber_bayes_low, y=mus_bayes_mean,
  #                  xend=ber_bayes_high,yend=mus_bayes_mean)) + 
  print(Figure2)

  Figure3 <- ggplot(data=df,
                    aes(x=ber_bayes_mean,y=mus_bayes_mean)) +
    geom_segment(aes(x=ber_bayes_mean, y=mus_bayes_low,
                     xend=ber_bayes_mean,yend=mus_bayes_high))  +
    geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 1) +
    geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
    scale_y_log10() +
    geom_abline(slope=1, intercept=0,linetype="dashed") +
    scale_x_log10()+ 
    xlab("Field RA") +
    ylab("Museum RA") +
    theme_bw(base_size=25)
  # geom_segment(aes(x=ber_bayes_low, y=mus_bayes_mean,
  #                  xend=ber_bayes_high,yend=mus_bayes_mean)) + 
  print(Figure3)
  
Figure4 <- ggplot(data=df,aes(x=ber_bayes_mean,y=mus_bayes_mean)) +
  geom_segment(aes(x=ber_bayes_mean, y=mus_bayes_low,
                   xend=ber_bayes_mean,yend=mus_bayes_high))  +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 1) +
  geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
  scale_y_log10() +
  geom_abline(slope=1, intercept=0,linetype="dashed") +
  scale_x_log10()+ 
  xlab("Berlese Relative Abundance") +
  ylab("Museum RA") +
geom_segment(aes(x=ber_bayes_low, y=mus_bayes_mean, 
                 xend=ber_bayes_high,yend=mus_bayes_mean)) +
  theme_bw(base_size=25)
print(Figure4)

panels <- (Figure1 | Figure2)/(Figure3 | Figure4)
print(panels)
ggsave(plot=panels, filename="Output/Berlese_Museum.pdf",
       width=15,height=7,units="in",device="pdf")