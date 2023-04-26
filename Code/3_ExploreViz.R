#-------------------------------------------------------------------------------
#Extract pixel values to crop data
#-------------------------------------------------------------------------------
#load source code
source("Code/2_ExtractPixels.R")
#-------------------------------------------------------------------------------
#Boxplots
#-------------------------------------------------------------------------------
#10m Band boxplots
ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band2)) +
  ggtitle("Band 2") +
  xlab("Crop Type") +
  ylab("Band 2 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band3)) +
  ggtitle("Band 3") +
  xlab("Crop Type") +
  ylab("Band 3 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band4)) +
  xlab("Crop Type") +
  ylab("Band 4 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band8)) +
  xlab("Crop Type") +
  ylab("Band 8 Surface Reflectance") +
  theme_bw()

#20m Band boxplots
ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band6)) +
  xlab("Crop Type") +
  ylab("Band 6 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band7)) +
  xlab("Crop Type") +
  ylab("Band 7 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band11)) +
  xlab("Crop Type") +
  ylab("Band 11 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band12)) +
  xlab("Crop Type") +
  ylab("Band 12 Surface Reflectance") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band8A)) +
  xlab("Crop Type") +
  ylab("Band 8A Surface Reflectance") +
  theme_bw()

#Indices Boxplots
ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = EVI)) +
  xlab("Crop Type") +
  ylab("Enhanced Vegetation Index") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = GCI)) +
  xlab("Crop Type") +
  ylab("Green Chlorophyll Index") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = NDTI)) +
  xlab("Crop Type") +
  ylab("Normalized Difference Tillage Index") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = PSRI)) +
  xlab("Crop Type") +
  ylab("Plant Senescence Reflectance Index") +
  theme_bw()

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = SAVI)) +
  xlab("Crop Type") +
  ylab("Soil Adjusted Vegetation Index") +
  theme_bw()
