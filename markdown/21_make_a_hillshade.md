# Hillshades

## Data


* [SF Digital Elevation Model](https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/GridFloat/n38w123.zip)


## Create a hillshade from a DEM

We will create a hillshade from the DEM called `sf-dem.tif`. To do this you can use the `gdaldem hillshade` command. The `gdaldem hillshade` command minimally takes the following arguments:

> gdaldem hillshade -of PNG inputDEM.tif outputHillshade.png

where

* PNG: the output format. It can also be TIF or others.
* inputDEM.tif: the input DEM raster file. The input can be any valid DEM raster file.
* outputHillshade.png: the output hillshade

Run the following in the terminal to generate a hillshade:

```
gdaldem hillshade -of PNG sf-dem.tif sf-dem-hillshade-default.png
```