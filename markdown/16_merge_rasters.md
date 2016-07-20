# Merge rasters

## gdal_warp
You can use `gdalwarp` to merge the images together:

> gdalwarp input1.tif input2.tif merged.tif

where:

* input1.tif input2.tif ...: the input files
* merged.tif: the merged output 

Give it a try here:

```
gdalwarp sf_4269-nobhill-10m.tif sf_4269-chinatown-10m.tif sf_4269-downtown-10m.tif sf-merged.tif
```

Or, to preserve nodata values:

gdalwarp input1.tif input2.tif merged.tif -srcnodata <nodata_value> -dstnodata <merged_nodata_value>


<!--## gdal_merge

You can mosaic multiple images to one image by using the `gdal_merge.py` command:


> gdal_merge.py -o merged.tif input1.tif input2.tif

where:

* -o: the flag for "output"
* merged.tif: the name of the merged file
* input1 input2 ...: the input files for merging


Give it a try:

```
gdal_merge.py -o sf-merged.tif sf_4269-chinatown.tif sf_4269-downtown.tif
```
-->




