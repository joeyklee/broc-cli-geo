# Slope Maps


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

<!--And voila! We've now made a hillshade, a colored-relief map, and a slope map!-->
