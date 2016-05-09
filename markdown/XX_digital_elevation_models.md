# Generate the Hillshade, Slope Shade, and Color Relief

## About 

 Digital Elevation Models (DEM) are raster data about topography. DEM's do not include features such as trees and buildings and are therefore different from Digital Surface Models (DSM) which include those features. DEM's are rich sources of data can be used generate hillshades, slope, and relief maps. 


## Data 

* [lake Tahoe DEM](https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/19/IMG/ned19_n39x50_w120x00_ca_nv_laketahoe_2010.zip)



## Process 

### Create a Hillshade

We will create a hillshade from the DEM called "ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img". To do this you can use the `gdaldem hillshade` command. The `gdaldem hillshade` command minimally takes the following arguments:

> gdaldem hillshade -of PNG inputDEM.tif outputHillshade.png

where

* PNG: the output format. It can also be TIF or others.
* inputDEM.tif: the input DEM raster file. The input can be any valid DEM raster file.
* outputHillshade.png: the output hillshade

Run the following in the terminal to generate a hillshade:

```
gdaldem hillshade -of PNG ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img ned19_n39x50_w120x00_ca_nv_laketahoe_2010_hillshade.png
```

### Change the Hillshade Light Direction

You can adjust the direction of the light by adding an argument to the `-az` (Azimuth) flag. Changing the direction of light will change the shadows cast on your DEM.

Give it a try by running the following:

```
gdaldem hillshade -of PNG -az 135 ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img ned19_n39x50_w120x00_ca_nv_laketahoe_2010_hillshade_az135.png
```

<!--
### Change the Hillshade Vertical exaggeration
You can adjust the vertical exaggeration of the hillshade by adding an argument to the `-z` (zFactor) flag. The default is 1.

```
gdaldem hillshade -of PNG -z 1.5 ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img ned19_n39x50_w120x00_ca_nv_laketahoe_2010_hillshade_z1_5.png
```
-->

### Make a Colored Relief Map

Color relief or hypsometric tints depict elevation as bands of color, to enhance elevation zones so map readers can better see differences in relief. The colors selected for the tints are assumed to relate to the ground cover typically found at various elevations in the area being mapped. A typical color scheme progresses from dark greens for lower elevations up through yellows/browns, and on to grays and white at the highest elevations - [Bjørn Sandvik](http://blog.thematicmapping.org/2012/06/creating-color-relief-and-slope-shading.html). 

In order to create color our DEM, we need to create colored breaks for a selected number of elevation bins. First, let's check what the min and max values are using the `gdalinfo` command:

```
gdalinfo ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img 
```

We should get something like this:

> Driver: HFA/Erdas Imagine Images (.img)
Files: ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img
       ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img.aux.xml
Size is 8112, 8112
Coordinate System is:
GEOGCS["GCS_North_American_1983",
    DATUM["North_American_Datum_1983",
        SPHEROID["GRS_1980",6378137.0,298.257222101]],
    PRIMEM["Greenwich",0.0],
    UNIT["Degree",0.017453292519943295]]
Origin = (-120.000185185185003,39.500185185185174)
Pixel Size = (0.000030864197531,-0.000030864197531)
Corner Coordinates:
Upper Left  (-120.0001852,  39.5001852) (120d 0' 0.67"W, 39d30' 0.67"N)
Lower Left  (-120.0001852,  39.2498148) (120d 0' 0.67"W, 39d14'59.33"N)
Upper Right (-119.7498148,  39.5001852) (119d44'59.33"W, 39d30' 0.67"N)
Lower Right (-119.7498148,  39.2498148) (119d44'59.33"W, 39d14'59.33"N)
Center      (-119.8750000,  39.3750000) (119d52'30.00"W, 39d22'30.00"N)
Band 1 Block=64x64 Type=Float32, ColorInterp=Undefined
  Description = Layer_1
  Min=1914.368 Max=3147.452 
  Minimum=1914.368, Maximum=3147.452, Mean=2476.869, StdDev=289.573
  NoData Value=-3.4028234663852886e+38
  Metadata:
    LAYER_TYPE=athematic
    STATISTICS_EXCLUDEDVALUES=
    STATISTICS_MAXIMUM=3147.4521484375
    STATISTICS_MEAN=2476.8688174219
    STATISTICS_MEDIAN=0
    STATISTICS_MINIMUM=1914.3679199219
    STATISTICS_MODE=0
    STATISTICS_SKIPFACTORX=1
    STATISTICS_SKIPFACTORY=1
    STATISTICS_STDDEV=289.57325845091
  Image Structure Metadata:
    COMPRESSION=RLE



We can see that: `Min=1914.368` and `Max=3147.452`. Using this information we can make some elevation breaks and some corresponding colors for each break. The example below shows how gdal will use apply a color to the pixels with the corresponding elevation.

```
elev1 r g b
elev2 r g b
elev3 r g b
elev4 r g b
...
```

Make a `color-relief.txt` using the `echo` command, like so. In this case, `echo` takes everything between the quotations and stuffs it into a file called `color-relief.txt` usng the `>` operator:

```
echo '0 0 0 0
1913 110 220 110
2407 240 250 160
2653 230 220 170
2900 220 220 220
3148 250 250 250' > color-relief.txt
```

Now we can generate our colored relief:

```
gdaldem color-relief -of PNG ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img color-relief.txt ned19_n39x50_w120x00_ca_nv_laketahoe_2010_coloredRelief.png
```

### Make a Slope Map

#### First create the slope terrain
We can also use our DEM to create a map of slopes on the terrain. We use the `gdaldem slope` command to achieve this. There are a variety of formats we can export to, but we can't export `.png`, so in this case we use `GTiff` (`.tif`):

```
gdaldem slope ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img ned19_n39x50_w120x00_ca_nv_laketahoe_2010_slope.tif
```

#### Second make Color Ramp and Create a Colored Relief Map

Using the same method as above, create a color palette for the slope degrees in a file called `color-slope.txt`:

```
echo '0 255 255 255
90 0 0 0' > color-slope.txt
```

Now we can use the `gdal color-relief` command to take our `color-slope.txt` colors and apply them to the slope map generated above:

```
gdaldem color-relief ned19_n39x50_w120x00_ca_nv_laketahoe_2010_slope.tif color-slope.txt ned19_n39x50_w120x00_ca_nv_laketahoe_2010_slopeShade.tif
```

And voila! We've now made a hillshade, a colored-relief map, and a slope map!

