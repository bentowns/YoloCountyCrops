#-------------------------------------------------------------------------------
#Clean the crop shapefile for machine learning
#-------------------------------------------------------------------------------
#load source code
source("0_Driver.R")
#-------------------------------------------------------------------------------
#Part 1: Selecting columns
#-------------------------------------------------------------------------------
#Rename columns
Crops <- rename(Crops, croptype = crop_list)
Crops <- rename(Crops, acres = calc_acres)

#Select required columns
Crops <- Crops %>% select(OBJECTID, OBJECTID_1, acres, croptype, geometry)
#-------------------------------------------------------------------------------
#Part 2: Filtering by crop
#-------------------------------------------------------------------------------
#Find all the unique crops
unique(Crops$croptype)
table(Crops$croptype)

#Select the following: Almond, Grape (Wine), Olive, Walnut
Crops <- Crops %>% filter(croptype == "OLIVE" | croptype == "WALNUT" | croptype == "ALMOND" |
                          croptype == "GRAPE, WINE")
