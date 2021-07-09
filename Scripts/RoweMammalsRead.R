# --------------------------------------
# Read in 2 Rowe mammal data sets
# for Ruby Mountains and Toiyabe Range
# 22 Apr 2020
# NJG
# --------------------------------------
#
# set up ruby data frame
df <- read.table(file="FormattedData/rowe_mammals_ruby.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

rowe_mammals_ruby <- df[,c(1,3,4)]
names(rowe_mammals_ruby) <- c("Species","x","y")

# set up toiyabe data frame
df <- read.table(file="FormattedData/rowe_mammals_toiyabe.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)
rowe_mammals_toiyabe <- df[,c(1,3,4)]
names(rowe_mammals_toiyabe) <- c("Species","x","y")

# write rds files
saveRDS(rowe_mammals_ruby,"DataObjects/rowe_mammals_ruby")
saveRDS(rowe_mammals_toiyabe,"DataObjects/rowe_mammals_toiyabe")