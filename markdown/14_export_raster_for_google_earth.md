# Export a raster for Google Earth

You may want to overlay your raster data onto google earth at some point. You can use the `KMLSUPEROVERLAY` output format, as shown below:

> gdal_translate -of KMLSUPEROVERLAY input.tif output.kmz -co FORMAT=JPEG

where:

* `-of:output` format
* `KMLSUPEROVERLAY` the kml output format
* `input.tif` the input file
* `output.kmz` the output file with the ".kmz" format
* `-co` the file compression flag
* `FORMAT=JPEG` the specified type of image compression

Let's export our `sf_4269.tif` file to a google earth format:

```
gdal_translate -of KMLSUPEROVERLAY sf_4269.tif sf_4269.kmz -co FORMAT=JPEG
```
