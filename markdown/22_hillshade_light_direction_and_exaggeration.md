# Change the hillshade light direction and vertical exaggeration 

## Light Direction (azimuth)

You can adjust the direction of the light by adding an argument to the `-az` (Azimuth) flag. Changing the direction of light will change the shadows cast on your DEM.

Give it a try by running the following:

```
gdaldem hillshade -of PNG -az 135 sf-dem.tif sf-dem-hillshade-az135.png
``` 


## Vertical Exaggeration

You can adjust the vertical exaggeration of the hillshade by adding an argument to the `-z` (zFactor) flag. The default is 1.

```
gdaldem hillshade -of PNG -z 2 sf-dem.tif sf-dem-hillshade-z2.png
``` 