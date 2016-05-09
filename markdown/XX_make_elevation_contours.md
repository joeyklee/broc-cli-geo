# Making Elevation Contours from a Digital Elevation Model (DEM)

## About

Contour lines are handy vector based representations elevation (or any variable). In this module, we will create contour lines from a raster DEM. 


## Data

* [lake Tahoe DEM](https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/19/IMG/ned19_n39x50_w120x00_ca_nv_laketahoe_2010.zip)


## Process

### Download the data

First things first, download the data. We are going to work with a small DEM from Lake Tahoe, California. We will use the `wget` command to retrieve the .zip file. To do this, type the following command in the terminal:

```
wget "https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/19/IMG/ned19_n39x50_w120x00_ca_nv_laketahoe_2010.zip"
```

### Unzip the folder

Now that the data is downloaded, unzip it using the `unzip` command. The `unzip` command takes the following arguements:

> unzip zipfolder.zip -d outputfoldername


```
unzip ned19_n39x50_w120x00_ca_nv_laketahoe_2010.zip -d ned19_n39x50_w120x00_ca_nv_laketahoe_2010
```

### Now enter the unzipped folder

After the folder has been unzipped, you must change into the directory that the files were unzipped to. Use `cd` to change to the directory.
<!--In this case, "ned19_n39x50_w120x00_ca_nv_laketahoe_2010". To do this, use the `cd` command which stands for "change directory".
-->

```
cd ned19_n39x50_w120x00_ca_nv_laketahoe_2010
```

Take a peek inside the folder using the `ls` command to determine which file is our DEM:

```
ls
```

This will return:

> NED_DataDictionary.url
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.dbf
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img.aux.xml
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.prj
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.sbn
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.sbx
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.shp
ned19_n39x50_w120x00_ca_nv_laketahoe_2010.shx
ned19_n39x50_w120x00_ca_nv_laketahoe_2010_meta.html
ned19_n39x50_w120x00_ca_nv_laketahoe_2010_meta.txt
ned19_n39x50_w120x00_ca_nv_laketahoe_2010_meta.xml
ned19_n39x50_w120x00_ca_nv_laketahoe_2010_thumb.jpg
ned19_readme.pdf
readme.pdf

Our DEM is: **ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img**

### Create contour

We can now use the `gdal_contour` command to generate the contour lines from the DEM. The `gdal_contour` command takes a number of arguments, but a minimum execution would include:

> gdal_contour -a heightFieldName DEMfile.img outputFileName.shp -i contourInterval

where:

* heightFieldName: The name of the field in the output vector file you want to height to live in.
* DEMfile.img: the name of the input DEM file. Any valid raster format is acceptable here (e.g. .tif, .grid, etc)
* outputFileName.shp: the name of the output shapefile with the contours. The default is contour.shp.
* contourInterval: The contour interval in units of the DEM's projection. TODO: is it in meters?

```
gdal_contour -a height ned19_n39x50_w120x00_ca_nv_laketahoe_2010.img output_contour_25m.shp -i 25.0
```

