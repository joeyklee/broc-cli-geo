# Raster Cropping & Clipping

## About
Often times working with raster data you will only want to work with a subset of the data. The subset of the data might be specified as a bounding box or by the boundaries of a shapefile. In this modules we'll learn how to crop and clip raster data.

## Data

* [SF Neighborhood Data - SF Open Data](https://data.sfgov.org/Geographic-Locations-and-Boundaries/Neighborhood-Groups-Map/iacs-ws63)
* [San Francisco NAIP Data](ftp://rockyftp.cr.usgs.gov/vdelivery/Datasets/Staged/NAIP/ca_2014/37122/m_3712213_se_10_1_20140613_20140923.jp2)

## Process

### Clip raster by bounding box
You can clip a raster by a specified bounding box. The coordinates will be based on the projection of the raster data, so if you need to, take a peek using the `gdalinfo` command. If you know the coordinates you'd like to clip to, you can input them as arguments of `gdalwarp`:

> gdalwarp -te <x_min> <y_min> <x_max> <y_max> input.tif clipped_output.tif

where: 

* -te: the flag specifying the clipping boundaries
* x_min: the minimum x value of the clipping bounds
* y_min: the minimum y value of the clipping bounds
* x_max: the maximum x value of the clipping bounds
* y_max: the maximum y value of the clipping bounds
* input.tif: the input file to be clipped
* clipped_output.tif: the clipped output file


Let's clip our `sf_4269.tif` file with a set of coordinates:

```
gdalwarp -te -122.4267 37.7492 -122.4029 37.769 sf_4269.tif sf_4269-clippedByCoords.tif
```

You may notice a black line - this indicates no data values since our bounding box was beyond the image bounds.


### Clip raster to SHP / NoData for pixels beyond polygon boundary

We can use a shapefile to clip out a subset of the raster data.

> gdalwarp -dstnodata <nodata_value> -cutline input_polygon.shp input.tif clipped_output.tif

where:

* -dstnodata: the flag specifying what the value of no data should be
* <nodata_value>: the value of the no data pixels 
* -cutline: the flag specifying to use a .shp file to cut the raster
* input_polygon.shp: a shapefile with the bounds to cut the raster to
* input.tif: the input raster file
* clipped_output.tif: the clipped output raster file

Let's clip the `sf_4269.tif` to the boundary of `downtown.shp`:

```
gdalwarp -dstnodata -9999 -cutline downtown.shp sf_4269.tif sf_4269-downtown.tif
```


### Crop raster dimensions to vector bounding box

We can also use the bounding box of a vector file to crop our raster data. 

<!--This will return a squareish image where only the pixels within the bounds of the vector will be shown and the outsides will have nodata-->

> gdalwarp -cutline input_polygon.shp -crop_to_cutline input.tif cropped_output.tif

where:

* -cutline: the flag specifying to use a .shp file to cut the raster
* input_polygon.shp: a shapefile with the bounds to cut the raster to
* -crop_to_cutline: the flag specifying to use the bounding box of the input_polygon.shp
* input.tif: the input raster file
* cropped_output.tif: the cropped output raster file

```
gdalwarp -cutline downtown.shp -crop_to_cutline sf_4269.tif sf_4269-downtownBounds.tif
```

