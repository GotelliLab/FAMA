# --------------------------------------
# Final multipanel plot for vertebrates
# 29 Aug 2020
# NJG
# --------------------------------------
library(tidyverse)
library(logger)
source("Scripts/BetaDirFunctions.R")



p1 <- fig_gen("DataObjects/magurran_fish_abun")
p1 <- p1 + labs(title="a. Trinidad & Tobago fishes (abundance)") +
 theme(plot.title = element_text(size=10))
p2 <- fig_gen("DataObjects/magurran_fish_occ")
p2 <- p2 + labs(title="b. Trinidad & Tobago fishes (incidence)") +
  theme(plot.title = element_text(size=10))
p3 <- fig_gen("DataObjects/rowe_mammals_ruby")
p3 <- p3 + labs(title="c. Ruby Mountains small mammals") +
  theme(plot.title = element_text(size=10))
p4 <- fig_gen("DataObjects/rowe_mammals_toiyabe")
p4 <- p4 + labs(title="d. Toiyabe Mountains small mammals") +
  theme(plot.title = element_text(size=10))
p5 <- fig_gen("DataObjects/urban_regional")
p5 <- p5 + labs(title="e. Connecticut amphibians (historical records)") +
  theme(plot.title = element_text(size=10))
p6 <- fig_gen("DataObjects/urban_total")
p6 <- p6 + labs(title="f. Connecticut amphibians (total records)") +
  theme(plot.title = element_text(size=10))

vert_panel <- (p1 + p2) / (p3 + p4) / (p5 + p6) 
  # plot_annotation(tag_levels = 'a',
  #                 tag_suffix = '.') & 
  # theme(plot.tag.position = c(0.2, 0.9),
  #       plot.tag = element_text(size = 12, hjust = 0, vjust = 0))
ggsave(plot=vert_panel, filename=("Output/Figure_3.pdf"),width=8.5,height=11,units="in",device="pdf")  
ggsave(plot=vert_panel, filename=("Output/Figure_3.jpeg"),width=8.5,height=11,units="in",device="jpeg")
ggsave(plot=vert_panel, filename=("Output/Figure_3.tiff"),width=8.5,height=11,units="in",device="tiff", dpi=600)