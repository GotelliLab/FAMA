# --------------------------------------
# Read in Booher ant data
# for Florida
# 10 May 2020
# NJG
# --------------------------------------
#
# set up data frame

# modified to use updated data from Booher
# df <- read.table(file="FormattedData/DirichletFinalV1.csv",
#                  stringsAsFactors = FALSE,
#                  comment.char="#",
#                  sep=",",
#                  header=TRUE)
library(tidyverse)
df_read <- read_csv(file="FormattedData/FAMA_speciesOccurrences.csv")
booher_ants <- spread(df_read,
             key=SourceCategory,
             value=Observations)

booher_ants[is.na(booher_ants)] <- 0

names(booher_ants) <- c("Species","x","y")

# write rds files
saveRDS(booher_ants,"DataObjects/booher_ants")
