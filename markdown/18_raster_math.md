# Raster calculations (map algebra)

## About
Rasters are matrices onto which algebra can be performed. You might want to average two rasters together - for example if you have hourly pollution data you can do a pixel-by-pixel average for the available data. You can use the `gdal_calc.py` command to do this. You might also want to take sums or divide rasters, etc. 

## Data

* []()
* []()

## Process

### Average two rasters:

> gdal_calc.py -A input1.tif -B input2.tif --outfile=output.tif --calc="(A+B)/2"

where:

* -A: this is a variable used later to model the calculation
* input1.tif: an input file that is linked to -A
* -B: this is a variable used later to model the calculation
* input2.tif: an input file that is linked to -B
* outfile=output.tif: specifying that the output of the calculation will be called "output.tif"
* --calc="(A+B)/2": the equation to calculate and average `"(A+B)/2"` is preceeded by the `--calc` flag which stands for calculation.



### Add two rasters bands:
You can add raster bands by adding the `--A_band` and `--B_band` together and by adjusting the `--calc` function.

> gdal_calc.py -A sf_4269-downtown.tif --A_band=1 -B sf_4269-downtown.tif --B_band=1 --outfile=sf-add.tif --calc="A+B"



<!--
### Band Calculations - Calculate NDVI:

> gdal_calc.py -A sf_4269-downtown.tif --A_band=4 -B sf_4269-downtown.tif --B_band=1 --outfile=sf-ndvi.tif --calc="(A-B)/(A+B)" --type='Float32' --overwrite-->