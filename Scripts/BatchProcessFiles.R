# --------------------------------------
# batch processing of functions for 
# validation analysis of museum and field records
# 22 Apr 2020
# NJG
# --------------------------------------
# source working functions ------------------
source("Scripts/BetaDirFunctions.R")

# create data frames ------------------
 source("Scripts/MagurranFishesRead.R")
source("Scripts/RoweMammalsRead.R")
source("Scripts/RehanBeesRead.R")
source("Scripts/PrimackTreesMaRead.R")
source("Scripts/PrimackButterfliesRead.R")
source("Scripts/BooherAntsRead.R")
source("Scripts/UrbanAmphibiansRead.R")
source("Scripts/NiButterfliesRead.R")
source("Scripts/IvanescuCollembolaRead_A.R")
source("Scripts/IvanescuCollembolaRead_B.R")
# --------------------------------------
# FUNCTION assemble
# description: run functions on individual
# data sets to create output stats and graphs
# inputs: name of data frame in correct format
# outputs: list of stats and pdfs of graphs
########################################
assemble <- function(data) {
  df <- readRDS(paste0("DataObjects/",data))
  f <- dirch_stats(df$x)
  m <- dirch_stats(df$y)
  dirch_plots(f,m,dataset=data)
  
  append(share_stats(a=df$x,b=df$y),
   dirch_reg(data=data,
             x=f$bayes_mean,
             y=m$bayes_mean))
  


} # end of assemble
# --------------------------------------

data_sets <- list.files("DataObjects/")

. <- lapply(X=data_sets,FUN=assemble)
z <- as.data.frame(do.call(rbind,.))
saveRDS(z,"Output/summary_stats")