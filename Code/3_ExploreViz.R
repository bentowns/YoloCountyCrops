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
  geom_boxplot(aes(x = croptype, y = Band2, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band3, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band4, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band8, color = croptype))

#20m Band boxplots
ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band6, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band7, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band11, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band12, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = Band8A, color = croptype))

#Indices Boxplots
ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = EVI, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = GCI, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = NDTI, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = PSRI, color = croptype))

ggplot(Crops) +
  geom_boxplot(aes(x = croptype, y = SAVI, color = croptype))