# --------------------------------------
# Read in Cristina Ivanescu's collembola data
# for field and museum all of Germany
# 21 July 2020
# NJG
# --------------------------------------
#
# set up data frame
df <- read.table(file="FormattedData/Collembola_Edaphobase_Ge_Variant_A.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

ivanescu_collem_a <- df[,c(1,3,2)]
names(ivanescu_collem_a) <- c("Species","x","y")

# remove 3 cases with 0 for both
# columns
ivanescu_collem_a <- 
ivanescu_collem_a[ivanescu_collem_a$x!=0 | ivanescu_collem_a$y!=0,]

# write rds files
saveRDS(ivanescu_collem_a,"DataObjects/collem_a")