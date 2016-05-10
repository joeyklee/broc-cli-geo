## Working with vector files

Geospatial data comes in a huge variety of formats. Understanding the formats you might find in the wild, how to recognise and inspect them are key skills for geospatial analysis at the command-line. Here we'll focus on vector files.

The `~/countries` directory contains 10m resolution countries data in shapefile format from [Natural Earth](www.naturalearthdata.com). Shapefiles are a very common vector format for geospatial data. A shapefile is actually a `.shp` file and a collection of supporting files - you can see the files by running [`ls`](https://en.wikipedia.org/wiki/Ls):

```
$ ls -1 countries
ne_10m_admin_0_countries.cpg
ne_10m_admin_0_countries.dbf
ne_10m_admin_0_countries.prj
ne_10m_admin_0_countries.README.html
ne_10m_admin_0_countries.shp
ne_10m_admin_0_countries.shx
ne_10m_admin_0_countries.VERSION.txt
```

### The GDAL toolkit

The [Geospatial Data Abstraction Library (GDAL/OGR)](http://www.gdal.org/) is a set of command-line utilities for working with a wide range of different raster and vector geospatial formats.

> **NOTE: the tools are already installed in this lesson**
> ... but if you ever need to install them on your own machine you can use:
>
> - OSX: `brew install gdal`
> - Linux (Debian / Ubuntu): `sudo apt-get install gdal-bin`

### Getting basic information about a geospatial data file

The [`ogrinfo`](http://www.gdal.org/ogrinfo.html) command from the GDAL toolkit allows us to find out what a geospatial vector data file contains.

> NOTE: As with most UNIX commands `ogrinfo` has a [manpage](https://en.wikipedia.org/wiki/Man_page), so you can use `man ogrinfo` to get detailed help at the command-line.

If we want to know what layers a file contains, we can run `ogrinfo` like so:

```
ogrinfo filepath
```

For example:

```
$ ogrinfo countries/ne_10m_admin_0_countries.shp
INFO: Open of `countries/ne_10m_admin_0_countries.shp'
      using driver `ESRI Shapefile' successful.
1: ne_10m_admin_0_countries (Polygon)
```

`ogrinfo` has printed a message telling us that it successfully read the file, followed by a numbered list of layers in the file. In this case, there is only a single layer, `ne_10m_admin_0_countries`, which is a [polygon]().

You can get a full list of the formats `ogrinfo` can read [here](http://www.gdal.org/ogr_formats.html).
