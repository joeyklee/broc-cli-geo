# Contour Maps


We can now use the `gdal_contour` command to generate the contour lines from the DEM. The `gdal_contour` command takes a number of arguments, but a minimum execution would include:

> gdal_contour -a heightFieldName DEMfile.img outputFileName.shp -i contourInterval

where:

* heightFieldName: The name of the field in the output vector file you want to height to live in.
* DEMfile.img: the name of the input DEM file. Any valid raster format is acceptable here (e.g. .tif, .grid, etc)
* outputFileName.shp: the name of the output shapefile with the contours. The default is contour.shp.
* contourInterval: The contour interval in units of the DEM's projection. TODO: is it in meters?

```
gdal_contour -a height sf-dem.tif output_contour_10m.shp -i 10.0
```

If you now list the files in the folder, you will see the "output_contour_25m.shp" file.

And now you have beautiful contour lines! 🗻
