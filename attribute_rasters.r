library(rgdal)
library(raster)



# Read the feature class 
dsn<-"//prbo.org/Data/Home/Petaluma/djongsomjit/Documents/projects/sealsfromspace/projected/fasticepoints5km.shp"
pts <- readOGR(dsn=dsn,layer="fasticepoints5km")




# Read the rasters.  Slope was created in degrees within ArcMap using the slope tool 
slope<-raster("//prbo.org/Data/Home/Petaluma/djongsomjit/Documents/projects/sealsfromspace/projected/slope_deg.tif")

bathy<-raster("C:/Users/djongsomjit/Downloads/IBCSO_v1_bed_PS71_500m_tif/ibcso_v1_bed.tif")
mystack<-stack(slope,bathy)


#Mean slope is the average slope within a given 5km cell block and only accounting for elevation values below 0
meanslope<-raster("//prbo.org/Data/Home/Petaluma/djongsomjit/Documents/projects/sealsfromspace/projected/slope_deg_avg5km.tif")

##### 



bathyslopemean<-extract(meanslope,pts,sp=TRUE)
bathyslope<-extract(mystack,bathyslopemean,sp=TRUE)

