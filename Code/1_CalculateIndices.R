#-------------------------------------------------------------------------------
#Calculate spectral indices
#-------------------------------------------------------------------------------
#load source code
source("0_Driver.R")
#-------------------------------------------------------------------------------
#Rescale reflectance
#-------------------------------------------------------------------------------
for (i in 1:4){
  YoloCoImages10m[[i]] <-YoloCoImages10m[[i]] / 10000
}
for (i in 1:8){
  YoloCoImages20m[[i]] <- YoloCoImages20m[[i]] / 10000
}
#-------------------------------------------------------------------------------
#Calculate Indices
#-------------------------------------------------------------------------------
#EVI
EVIYoloCo <- EVI(YoloCoImages10m[[1]], YoloCoImages10m[[3]], YoloCoImages10m[[4]])

#GCI
GCIYoloCo <- GCI(YoloCoImages10m[[2]], YoloCoImages10m[[4]])

#NDTI
NDTIYoloCo <- NDTI(YoloCoImages20m[[6]], YoloCoImages20m[[7]])

#PSRI
PSRIYoloCo <- PSRI(YoloCoImages20m[[1]], YoloCoImages20m[[2]], YoloCoImages20m[[4]])

#SAVI
SAVIYoloCo <- SAVI(YoloCoImages10m[[3]], YoloCoImages10m[[4]])