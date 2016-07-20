# Basic Raster operations

## About
GDAL has a suite of handy commands for working with raster data. In this module, we will learn to:

* inspect raster data,
* convert between raster formats
* reproject rasters to different projections
* export a raster to Google Earth

## Data

* [San Francisco NAIP Data](ftp://rockyftp.cr.usgs.gov/vdelivery/Datasets/Staged/NAIP/ca_2014/37122/m_3712213_se_10_1_20140613_20140923.jp2)

<!--## Handy Commands-->


<!--
### Force creation of world file (requires libgeotiff)
```
listgeo -tfw mappy.tif
```
-->


<!--
### Convert 16-bit bands (Int16 or UInt16) to Byte type
(Useful for Landsat 8 imagery...)

gdal_translate -of "GTiff" -co "COMPRESS=LZW" -scale 0 65535 0 255 -ot Byte input_uint16.tif output_byte.tif

You can change '0' and '65535' to your image's actual min/max values to preserve more color variation or to apply the scaling to other band types - find that number with:

gdalinfo -mm input.tif | grep Min/Max
-->

<!--### Convert a directory of raster files of the same format to another raster format

There are times when working with raster data that you will have multiple types of data formats in one project. You can convert a directory of raster files of the same format to another raster format using this handy command:

basename -s.img *.img | xargs -n1 -I % gdal_translate -of "GTiff" %.img %.tif-->
