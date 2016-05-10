### Convert between raster formats
You may prefer to work in one type of raster data versus another. Use the `gdal_translate` command to convert from one raster type to another:


> gdal_translate -of GTiff input.grd output.tif

where:

* `-of` means "output file type"
* `GTiff` here we're specifying geotiff as our output
* `input.grd` this is the input file we want to convert. It is .grd type.
* `output.tif` this is the output file we want. Here we are outputting a .tif file.

Let's convert our "sf.tif" to "sf.png":

```
gdal_translate -of PNG sf_4269.tif sf_4269.png
```
