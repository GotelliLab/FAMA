# --------------------------------------
# Read in Urban amphibian data and create three data frames
# 1) Urban versus PR (= Skelly data)
# 2) Urban versus regional
# 3) Urban versus total (PR + regional)
# 21 Apr 2020
# NJG
# --------------------------------------
#
df <- read.table(file="FormattedData/Amphibians_Mus_Plus_Skel.csv",
                 stringsAsFactors = FALSE,
                 comment.char="#",
                 sep=",",
                 header=TRUE)

df <- df[complete.cases(df),]
# set up Urban versus regional
urban_regional <- df[,c(1,2,4)]
names(urban_regional) <- c("Species","x","y")

# set up Urban versus total
urban_total <- df[,c(1,2,5)]
names(urban_total) <- c("Species","x","y")

# write rds files
saveRDS(urban_regional,"DataObjects/urban_regional")
saveRDS(urban_total,"DataObjects/urban_total")