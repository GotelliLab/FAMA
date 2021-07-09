# --------------------------------------
# Read in Primack Massachusetts tree data 
# 23 Apr 2020
# modified 5 March 2021 to switch to 
# plot level incidence data

# NJG
# --------------------------------------
#

df <- read.table(file="FormattedData/primack_trees_ma_incid.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)
#--------------------------------------------
# COMMENTED OUT READ OF ORIGINAL ABUNDANCE DATA
# df <- read.table(file="FormattedData/primack_trees_ma.csv",
#                  stringsAsFactors = FALSE,
#                  comment.char="#",
#                  sep=",",
#                  header=TRUE)
#--------------------------------------------

primack_trees_ma <- df[,c(1,3,2)]
names(primack_trees_ma) <- c("Species","x","y")

# write rds files
saveRDS(primack_trees_ma,"DataObjects/primack_trees_ma")