# --------------------------------------
# Read in George Ni's butterfly data
# for North Carolina
# 14 June 2020
# NJG
# --------------------------------------
# 2 July 2020
# Updated data set provided by George
# 0 = true zero
# NaN = no records
#
# set up data frame
df <- read.table(file="FormattedData/Museum_Citizen_Science_Comparison_Updated.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

df <- df[complete.cases(df),] # remove NaNs in updated data file
ni_butterflies <- df[,c(2,4,3)]
names(ni_butterflies) <- c("Species","x","y")

# write rds files
saveRDS(ni_butterflies,"DataObjects/ni_butterflies")
