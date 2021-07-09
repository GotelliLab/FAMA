# --------------------------------------
# Read in Primack butterfly data
# from Polgar et al.2013. Biological Conservation 160: 25-31.
# Data split as old and new. Treating new as mostly field
# records, old as mostly museum records
# 22 Apr 2020
# NJG
# --------------------------------------
#
# set up data frame
df <- read.table(file="FormattedData/primack_butterflies.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

primack_butterflies <- df[,c(1,2,3)]
names(primack_butterflies) <- c("Species","x","y")

# write rds files
saveRDS(primack_butterflies,"DataObjects/primack_butterflies")