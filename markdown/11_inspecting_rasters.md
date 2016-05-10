
# Inspecting raster files

We can retrieve the projection details in greater detail by using the `listgeo -proj4` command:

> listgeo -proj4 inputFile.tif

Where:

* `inputFile.tif` is the raster file of interest.

Let's see what the projection info of our San Francisco imagery is:

```
listgeo -proj4 sf_4269.tif
```
