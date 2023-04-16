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
