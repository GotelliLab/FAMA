# --------------------------------------
# Read in Sandra Rehan bee data
# for New Hampshire
# 22 Apr 2020
# NJG
# --------------------------------------
#
# set up data frame
df <- read.table(file="FormattedData/rehan_bees.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

rehan_bees <- df[,c(1,3,2)]
names(rehan_bees) <- c("Species","x","y")

# write rds files
saveRDS(rehan_bees,"DataObjects/rehan_bees")