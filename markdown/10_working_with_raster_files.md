# Inspecting raster files

## Getting basic information

We can use `gdalinfo` to get information about a raster data file:

> gdalinfo inputFile.tif

Where:

* `inputFile.tif` is the raster file of interest.

Now run `gdalinfo` on our image of San Francisco:

```
gdalinfo sf_4269.tif
```

The result will be a slew of information on the raster including basic statistics (e.g. min, max, mean) of the raster cells, the bounding box, and the projection info, etc.

### Listing drivers

Often times you will want to check what types of data formats gdal supports. You can access the list of these file formats using the `gdal_translate --formats` command:

```
gdal_translate --formats
```
