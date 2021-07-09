# --------------------------------------
# Final multipanel plot for inverts
# 29 Aug 2020
# NJG
# --------------------------------------
library(tidyverse)
library(logger)
source("Scripts/BetaDirFunctions.R")



p1 <- fig_gen("DataObjects/booher_ants")
p1 <- p1 + labs(title="a. Florida ants") +
 theme(plot.title = element_text(size=10))
p2 <- fig_gen("DataObjects/rehan_bees")
p2 <- p2 + labs(title="b. New Hampshire bees") +
  theme(plot.title = element_text(size=10))
p3 <- fig_gen("DataObjects/primack_butterflies")
p3 <- p3 + labs(title="c. Massachusetts butterflies") +
  theme(plot.title = element_text(size=10))
p4 <- fig_gen("DataObjects/ni_butterflies")
p4 <- p4 + labs(title="d. North Carolina butterflies") +
  theme(plot.title = element_text(size=10))
p5 <- fig_gen("DataObjects/collem_a")
p5 <- p5 + labs(title="e. Germany collembola") +
  theme(plot.title = element_text(size=10))
p6 <- fig_gen("DataObjects/collem_b")
p6 <- p6 + labs(title="f. Saxony collembola") +
  theme(plot.title = element_text(size=10))

invert_panel <- (p1 + p2) / (p3 + p4) / (p5 + p6) 
  # plot_annotation(tag_levels = 'a',
  #                 tag_suffix = '.') & 
  # theme(plot.tag.position = c(0.2, 0.9),
  #       plot.tag = element_text(size = 12, hjust = 0, vjust = 0))
ggsave(plot=invert_panel, filename=("Output/Figure_2.pdf"),width=8.5,height=11,units="in",device="pdf")  
ggsave(plot=invert_panel, filename=("Output/Figure_2.jpeg"),width=8.5,height=11,units="in",device="jpeg")
ggsave(plot=invert_panel, filename=("Output/Figure_2.tiff"),width=8.5,height=11,units="in",device="tiff",dpi=600)