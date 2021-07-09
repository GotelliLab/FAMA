# --------------------------------------
# Creates a new Figure 1 showing Booher data from raw
# state to final 4 panel figure
# 28 Aug 2020
# NJG
# --------------------------------------
library(tidyverse)
library(patchwork)
source("Scripts/BooherAntsRead.R")
source("Scripts/BetaDirFunctions.R")
p1 <- ggplot(booher_ants) +
      aes(x = x, y = y) +
      geom_point() + 
      theme_bw(base_size = 20) + 
      # geom_smooth(method = "lm", size = 0.75)
      labs(x = "Field Records",
           y = "Museum Records")
# plot(p1)


df1 <- dirch_stats(booher_ants$x)
df2 <- dirch_stats(booher_ants$y)
df <- cbind(df1,df2)
names(df) <- c(paste0("x",1:5),paste0("y",1:5))

p2 <- ggplot(data=df,
                  aes(x=x3,y=y3)) +
  geom_point() +
  # geom_segment(aes(x=field_bayes_mean, y=musee_bayes_low,
  #                  xend=field_bayes_mean,yend=musee_bayes_high))  +
   geom_segment(aes(x=x3, y=y4,
                    xend=x3,yend=y5),size=0.3)  +
  # scale_y_log10() +
  # geom_abline(slope=1, intercept=0,linetype="dashed") +
  # scale_x_log10()+ 
  labs(x = "Field RA", 
       y = "Museum RA") +
# geom_segment(aes(x=field_bayes_low, y=musee_bayes_mean, 
#                  xend=field_bayes_high,yend=musee_bayes_mean)) +
 geom_segment(aes(x=x4, y=y3, 
                  xend=x5,yend=y3),size=0.3) +
#   geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 1) +
#   geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
  theme_bw(base_size=20) 
# plot(p2)

p3 <- ggplot(data=df,
                  aes(x=x3,y=y3)) +
  geom_point() +
  # geom_segment(aes(x=field_bayes_mean, y=musee_bayes_low,
  #                  xend=field_bayes_mean,yend=musee_bayes_high))  +
   geom_segment(aes(x=x3, y=y4,
                    xend=x3,yend=y5),size=0.3)  +
  # geom_abline(slope=1, intercept=0,linetype="dashed") +
   scale_x_log10()+ 
   scale_y_log10()+ 
  labs(x = "Field RA", 
       y = "Museum RA") +
# geom_segment(aes(x=field_bayes_low, y=musee_bayes_mean, 
#                  xend=field_bayes_high,yend=musee_bayes_mean)) +
 geom_segment(aes(x=x4, y=y3, 
                  xend=x5,yend=y3),size=0.3) +
#   geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 1) +
#   geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
  theme_bw(base_size=20) 
# plot(p3)


p4 <- ggplot(data=df,
                  aes(x=x3,y=y3)) +
  geom_point() +
  # geom_segment(aes(x=field_bayes_mean, y=musee_bayes_low,
  #                  xend=field_bayes_mean,yend=musee_bayes_high))  +
   # geom_segment(aes(x=x3, y=y4,
   #                  xend=x3,yend=y5),size=0.3)  +
   scale_y_log10() +
  geom_abline(slope=1, intercept=0,linetype="dashed") +
  scale_x_log10()+
  labs(x = "Field RA", 
       y = "Museum RA") +
# geom_segment(aes(x=field_bayes_low, y=musee_bayes_mean, 
#                  xend=field_bayes_high,yend=musee_bayes_mean)) +
 # geom_segment(aes(x=x4, y=y3, 
                  # xend=x5,yend=y3),size=0.3) +
   geom_point(shape = 21, colour = "black", fill = "white", size = 2, stroke = 1) +
   geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95, linetype="solid") +
  theme_bw(base_size=20) 
# plot(p4)

Fig1 <- (p1 | p2) / (p3 | p4) +
  plot_annotation(title="", 
                  tag_levels = 'a',
                  tag_suffix = '.') & 
  theme(plot.tag.position = c(0.2, 1.05),
        plot.tag = element_text(size = 12, hjust = 0, vjust = 0))
ggsave(plot=Fig1, filename=("Output/Figure_1.pdf"),width=11,height=8.55,units="in",device="pdf")  
ggsave(plot=Fig1, filename=("Output/Figure_1.jpeg"),width=11,height=8.55,units="in",device="jpeg")  
ggsave(plot=Fig1, filename=("Output/Figure_1.tiff"),width=11,height=8.55,units="in",device="tiff",dpi=600)  