#You must be running this project, or code will not work!
#Set working directory
rm(list = ls())
dir0_main <- getwd() #Level 0 folder
#-------------------------------------------------------------------------------
#Directories
#-------------------------------------------------------------------------------
#Level 1
dir1_code <- paste(dir0_main, "Code", sep="/") 
dir1_data <- paste(dir0_main, "Data", sep="/")
dir1_outputs <- paste(dir0_main, "Outputs", sep="/")


#Level 2 directories
dir2data_crops <- paste(dir1_data, "Crops", sep="/") 
dir2data_yoloimage <- paste(dir1_data, "YoloCounty20200628", sep="/")

#Level 3 directory
dir3data_10m <- paste(dir2data_yoloimage, "10m", sep="/")
dir3data_20m <- paste(dir2data_yoloimage, "20m", sep="/")
#-------------------------------------------------------------------------------
#Load required packages
#-------------------------------------------------------------------------------
library(raster) #Uploading raster data
library(sf) #Uploading shapefiles
library(exactextractr) #For extracting district values
library(tidyverse) #For filtering
library(parallel) #For parallel processing
library(foreach) #For parallel processing
library(doParallel) #For parallel processing
library(tictoc) #For parallel processing
#-------------------------------------------------------------------------------
#Load parallel
ncores <- detectCores(logical = FALSE)
registerDoParallel(cores=ncores)
#-------------------------------------------------------------------------------
#Load Data
#-------------------------------------------------------------------------------
#Crop data
loc_Crops <- paste(dir2data_crops, "YoloCountyCrops2020.shp", sep = "/")
Crops <- st_read(loc_Crops)
#-------------------------------------------------------------------------------
#Importing all files as a list
ImageList10m <- list.files(path = dir3data_10m,
                        pattern = '.jp2$',
                        all.files = TRUE,
                        full.names = FALSE)
ImageList20m <- list.files(path = dir3data_20m,
                           pattern = '.jp2$',
                           all.files = TRUE,
                           full.names = FALSE)

#forward slash to connect the file path
ImageFullList10m <- paste(dir3data_10m, ImageList10m, sep = "/")
ImageFullList20m <- paste(dir3data_20m, ImageList20m, sep = "/")

#Load Rasters

YoloCoImages10m <- list()
YoloCoImages20m <- list()

for (i in 1:4){
  YoloCoImages10m[[i]] <- raster(ImageFullList10m[i])
}
for (i in 1:8){
  YoloCoImages20m[[i]] <- raster(ImageFullList20m[i])
}
#-------------------------------------------------------------------------------
#Functions for calculating Vegetation Indices
#-------------------------------------------------------------------------------
#Enhanced Vegetation Index (EVI)
EVI <- function(B2, B4, B8) {
  EVIscore <- 2.5 * ((B8 - B4) / (B8 + 6 * B4 - 7.5 * B2 + 1))
  return(EVIscore)
}

#Green Chlorophyll Index (GCI)
GCI <- function(B3, B8) {
  GCIscore <- (B8/B3) - 1
  return(GCIscore)
}

#Plant Senescence Reflectance Index (PSRI)
PSRI <- function(B2, B4, B6) {
  PSRIscore <- (B4-B2) / B6
  return(PSRIscore)
}

#Soil-Adjusted Vegetation Index (SAVI)
SAVI <- function(B4, B8) {
  SAVIscore <- 1.5(B8 - B4) / (B8 + B4 + 0.5)
  return(SAVIscore)
}

#Normalized Difference Tillage Index (NDTI)
NDTI <- function(B11, B12) {
  SAVIscore <- (B11 - B12) / (B11 + B12)
  return(NDTIscore)
}
