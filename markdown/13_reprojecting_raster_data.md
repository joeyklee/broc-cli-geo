# Reprojecting Raster Data

When working with geographic data, it is important to work in the same projection. We can use the `gdal_warp` command to reproject a raster dataset. NOTE: reprojecting raster data should be done with caution since the size of the pixels can change depending on the projection being used.

> gdalwarp -t_srs "EPSG:XXXX" input.tif output.tif

where:

* `-t_srs` this is the projection you want the input file to be projected to
* `EPSG:XXXX` this is the EPSG code you want to reproject your raster to.
* `input.tif` this is the input file
* `output.tif` this is the output file

Be sure to add `-r bilinear` if reprojecting elevation data to prevent funky banding artifacts.

Let's reproject our SF raster data to the `EPSG:26910` which is the UTM zone 10N:

```
gdalwarp -t_srs "EPSG:26910" sf_4269.tif sf_utm10n.tif
```
