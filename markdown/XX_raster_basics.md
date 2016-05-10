# Basic Raster operations

## About
GDAL has a suite of handy commands for working with raster data. In this module, we will learn to:

* inspect raster data, 
* convert between raster formats
* reproject rasters to different projections
* and export a raster to Google Earth

## Data

* [San Francisco NAIP Data](ftp://rockyftp.cr.usgs.gov/vdelivery/Datasets/Staged/NAIP/ca_2014/37122/m_3712213_se_10_1_20140613_20140923.jp2)

## Handy Commands

### Get raster information
We can retrieve the raster info by using the `gdalinfo` command:

> gdalinfo inputFile.tif

Where:

* inputFile.tif: is the raster file of interest. 

Now run `gdalinfo` on our image of San Francisco:

```
gdalinfo sf_4269.tif
```

The result will be a slew of information on the raster including basic statistics (e.g. min, max, mean) of the raster cells, the bounding box, and the projection info, etc.

```
...
```


### List raster drivers
Often times you will want to check what types of data formats gdal supports. You can access the list of these file formats using the `gdal_translate --formats` command:

```
gdal_translate --formats
```


<!--
### Force creation of world file (requires libgeotiff)
```
listgeo -tfw  mappy.tif
```
-->

### Report PROJ.4 projection info, including bounding box (requires libgeotiff)

We can retrieve the projection details in greater detail from `gdalinfo` by using the `listgeo -proj4` command:

> listgeo -proj4 inputFile.tif

Where:

* inputFile.tif: is the raster file of interest. 

Let's see what the projection info of our San Francisco imagery is:

```
listgeo -proj4 sf_4269.tif
```

### Convert between raster formats
You may prefer to work in one type of raster data versus another. Use the `gdal_translate` command to convert from one raster type to another:


> gdal_translate -of GTiff input.grd output.tif

where:

* -of: means "output file type"
* "GTiff": here we're specifying geotiff as our output
* input.grd: this is the input file we want to convert. It is .grd type.
* output.tif: this is the output file we want. Here we are outputting a .tif file.

Let's convert our "sf.tif" to "sf.png":

```
gdal_translate -of PNG sf_4269.tif sf_4269.png
```

### Reprojecting Raster Data

When working with geographic data, it is important to work within in the same projection. We can use the `gdal_warp` command to reproject a raster dataset. NOTE: reprojecting raster data should be done with caution since the size of the pixels can change depending on the projection being used. 

> gdalwarp -t_srs "EPSG:XXXX" input.tif output.tif

where:

* -t_srs: this is the projection you want the input file to be projected to
* "EPSG:XXXX": this is the EPSG code you want to reproject your raster to.
* input.tif: this is the input file
* output.tif: this is the output file

Be sure to add `-r bilinear` if reprojecting elevation data to prevent funky banding artifacts.

Let's reproject our SF raster data to the `EPSG:26910` which is the UTM zone 10N:

```
gdalwarp -t_srs "EPSG:26910" sf_4269.tif sf_utm10n.tif
```

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


### Export a raster for Google Earth
You may want to overlay your raster data onto google earth at some point. You can use the `KMLSUPEROVERLAY` output format, as shown below:

> gdal_translate -of KMLSUPEROVERLAY input.tif output.kmz -co FORMAT=JPEG

where:

* -of:output format
* KMLSUPEROVERLAY: the kml output format 
* input.tif: the input file
* output.kmz: the output file with the ".kmz" format
* -co: the file compression flag
* FORMAT=JPEG: the specified type of image compression

Let's export our `sf_4269.tif` file to a google earth format:

```
gdal_translate -of KMLSUPEROVERLAY sf_4269.tif sf_4269.kmz -co FORMAT=JPEG
```

Hooray! Now we've got an idea of some of the basic raster operations. 