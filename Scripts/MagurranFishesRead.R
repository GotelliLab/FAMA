# --------------------------------------
# Read in Magurran fish data and create two data frames
# one for occurrence records and one for abundance records
# 21 Apr 2020
# NJG
# --------------------------------------
#
df <- read.table(file="FormattedData/TrinidadFishForNick.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

# set up occupancy data frame
magurran_fish_occ <- df[,c(1,4,7)]
names(magurran_fish_occ) <- c("Species","x","y")

# set up abundance data frame
magurran_fish_abun <- df[,c(1,5,7)]
names(magurran_fish_abun) <- c("Species","x","y")

# write rds files
saveRDS(magurran_fish_occ,"DataObjects/magurran_fish_occ")
saveRDS(magurran_fish_abun,"DataObjects/magurran_fish_abun")