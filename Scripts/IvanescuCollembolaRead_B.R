# --------------------------------------
# Read in Cristina Ivanescu's collembola data
# for field and museum restricted
# just to Saxony
# 21 July 2020
# NJG
# --------------------------------------
#
# set up data frame
df <- read.table(file="FormattedData/Collembola_Edaphobase_Ge_Variant_B.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

ivanescu_collem_b <- df[,c(1,3,2)]
names(ivanescu_collem_b) <- c("Species","x","y")


# write rds files
saveRDS(ivanescu_collem_b,"DataObjects/collem_b")