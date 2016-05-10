# Generate the Hillshade, Slope Shade, and Color Relief

## About 

 Digital Elevation Models (DEM) are raster data about topography. DEM's do not include features such as trees and buildings and are therefore different from Digital Surface Models (DSM) which include those features. DEM's are rich sources of data can be used generate hillshades, slope, and relief maps. 


## Data 

* [SF Digital Elevation Model](https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/GridFloat/n38w123.zip)



## Process 

### Create a Hillshade

We will create a hillshade from the DEM called `sf-dem.tif`. To do this you can use the `gdaldem hillshade` command. The `gdaldem hillshade` command minimally takes the following arguments:

> gdaldem hillshade -of PNG inputDEM.tif outputHillshade.png

where

* PNG: the output format. It can also be TIF or others.
* inputDEM.tif: the input DEM raster file. The input can be any valid DEM raster file.
* outputHillshade.png: the output hillshade

Run the following in the terminal to generate a hillshade:

```
gdaldem hillshade -of PNG sf-dem.tif sf-dem-hillshade-default.png
```

### Change the Hillshade Light Direction

You can adjust the direction of the light by adding an argument to the `-az` (Azimuth) flag. Changing the direction of light will change the shadows cast on your DEM.

Give it a try by running the following:

```
gdaldem hillshade -of PNG -az 135 sf-dem.tif sf-dem-hillshade-az135.png
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

In order to create color our DEM, we need to create colored breaks for a selected number of elevation bins. First, let's check what the min and max values are using the `gdalinfo` command with the `-stats` flag:

```
gdalinfo sf-dem.tif -stats
```

We should get something like this:

```
Josephs-MacBook-Pro-2:XX_digital_elevation_models Jozo$ gdalinfo sf-dem.tif -stats
Driver: GTiff/GeoTIFF
Files: sf-dem.tif
Size is 676, 675
Coordinate System is:
GEOGCS["NAD83",
    DATUM["North_American_Datum_1983",
        SPHEROID["GRS 1980",6378137,298.2572221010002,
            AUTHORITY["EPSG","7019"]],
        TOWGS84[0,0,0,0,0,0,0],
        AUTHORITY["EPSG","6269"]],
    PRIMEM["Greenwich",0],
    UNIT["degree",0.0174532925199433],
    AUTHORITY["EPSG","4269"]]
Origin = (-122.437530223697820,37.812525827311823)
Pixel Size = (0.000092539239086,-0.000092652993030)
Metadata:
  AREA_OR_POINT=Area
Image Structure Metadata:
  INTERLEAVE=BAND
Corner Coordinates:
Upper Left  (-122.4375302,  37.8125258) (122d26'15.11"W, 37d48'45.09"N)
Lower Left  (-122.4375302,  37.7499851) (122d26'15.11"W, 37d44'59.95"N)
Upper Right (-122.3749737,  37.8125258) (122d22'29.91"W, 37d48'45.09"N)
Lower Right (-122.3749737,  37.7499851) (122d22'29.91"W, 37d44'59.95"N)
Center      (-122.4062520,  37.7812554) (122d24'22.51"W, 37d46'52.52"N)
Band 1 Block=676x3 Type=Float32, ColorInterp=Gray
  Minimum=-2.314, Maximum=126.607, Mean=19.995, StdDev=24.762
  NoData Value=-9999
  Metadata:
    STATISTICS_MAXIMUM=126.60684204102
    STATISTICS_MEAN=19.995340656419
    STATISTICS_MINIMUM=-2.3140776157379
    STATISTICS_STDDEV=24.762441881228
```

We can see that: `Min=-2.4` and `Max=126.7`. Using this information we can make some elevation breaks and some corresponding colors for each break. The example below shows how gdal will use apply a color to the pixels with the corresponding elevation.

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
26 110 220 110
51 240 250 160
76 230 220 170
101 220 220 220
127 250 250 250' > color-relief.txt
```

Now we can generate our colored relief:

```
gdaldem color-relief -of PNG sf-dem.tif color-relief.txt sf-dem-coloredRelief.tif
```

### Make a Slope Map

#### First create the slope terrain
We can also use our DEM to create a map of slopes on the terrain. We use the `gdaldem slope` command to achieve this. There are a variety of formats we can export to, but we can't export `.png`, so in this case we use `GTiff` (`.tif`):

```
gdaldem slope sf-dem.tif sf-dem-slope.tif
```

#### Second make Color Ramp and Create a Colored Relief Map

Using the same method as above, create a color palette for the slope degrees in a file called `color-slope.txt`:

```
echo '0 255 255 255
90 0 0 0' > color-slope.txt
```

Now we can use the `gdal color-relief` command to take our `color-slope.txt` colors and apply them to the slope map generated above:

```
gdaldem color-relief sf-dem-coloredRelief.tif color-slope.txt sf-dem-slopeShade.tif
```

And voila! We've now made a hillshade, a colored-relief map, and a slope map!

