#-------------------------------------------------------------------------------
#Extract pixel values to crop data
#-------------------------------------------------------------------------------
#load source code
source("Code/1_CalculateIndices.R")
#-------------------------------------------------------------------------------
#Part 1: Selecting columns
#-------------------------------------------------------------------------------
#Rename columns
Crops <- rename(Crops, croptype = crop_list)
Crops <- rename(Crops, acres = calc_acres)

#Select required columns
Crops <- Crops %>% select(OBJECTID, OBJECTID_1, acres, croptype, geometry)
#-------------------------------------------------------------------------------
#Extract Pixel Values
#-------------------------------------------------------------------------------
#10 meter bands
Crops$Band2 <- exact_extract(YoloCoImages10m[[1]], Crops, "mean")
Crops$Band3 <- exact_extract(YoloCoImages10m[[2]], Crops, "mean")
Crops$Band4 <- exact_extract(YoloCoImages10m[[3]], Crops, "mean")
Crops$Band8 <- exact_extract(YoloCoImages10m[[4]], Crops, "mean")

#20 meter bands
Crops$Band5 <- exact_extract(YoloCoImages20m[[3]], Crops, "mean")
Crops$Band6 <- exact_extract(YoloCoImages20m[[4]], Crops, "mean")
Crops$Band7 <- exact_extract(YoloCoImages20m[[5]], Crops, "mean")
Crops$Band11 <- exact_extract(YoloCoImages20m[[6]], Crops, "mean")
Crops$Band12 <- exact_extract(YoloCoImages20m[[7]], Crops, "mean")
Crops$Band8A <- exact_extract(YoloCoImages20m[[8]], Crops, "mean")

#Vegetation Indices
Crops$EVI <- exact_extract(EVIYoloCo, Crops, "mean")
Crops$GCI <- exact_extract(GCIYoloCo, Crops, "mean")
Crops$NDTI <- exact_extract(NDTIYoloCo, Crops, "mean")
Crops$PSRI <- exact_extract(PSRIYoloCo, Crops, "mean")
Crops$SAVI <- exact_extract(SAVIYoloCo, Crops, "mean")
#-------------------------------------------------------------------------------
#Part 2: Filtering by crop
#-------------------------------------------------------------------------------
#Find all the unique crops
unique(Crops$croptype)
table(Crops$croptype)

#Select the following: Almond, Grape (Wine), Olive, Walnut
Crops <- Crops %>% filter(croptype == "OLIVE" | croptype == "WALNUT" | croptype == "ALMOND" |
                            croptype == "GRAPE, WINE")
#-------------------------------------------------------------------------------
#Export to csv
#-------------------------------------------------------------------------------
Crops.df <- st_drop_geometry(Crops)
write.csv(Crops.df, "YoloCountyCropsML.csv")
