## Working with geospatial data formats

Geospatial data comes in a huge variety of formats. Understanding the formats you might find in the wild, how to recognise and inspect them are key skills for geospatial analysis at the command-line.

The `~/data` directory contains 10m resolution countries data in various formats from [Natural Earth](www.naturalearthdata.com). You can see the files by running [`ls`](https://en.wikipedia.org/wiki/Ls):

```
$ ls -1 data
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

**The tools are already installed in this lesson**, but if you ever need to install them on your own machine you can use:

- OSX: `brew install gdal`
- Linux (Debian / Ubuntu): `sudo apt-get install gdal-bin`

### Getting basic information about a geospatial data file

The [`ogrinfo`](http://www.gdal.org/ogrinfo.html) command from the GDAL toolkit allows us to find out what a geospatial vector data file contains.

> NOTE: As with most UNIX commands `ogrinfo` has a [manpage](https://en.wikipedia.org/wiki/Man_page), so you can use `man ogrinfo` to get detailed help at the command-line.

If we want to know what layers a file contains, we can run `ogrinfo` like so:

```
ogrinfo filepath
```

For example:

```
$ ogrinfo data/ne_10m_admin_0_countries.shp
INFO: Open of `data/ne_10m_admin_0_countries.shp'
      using driver `ESRI Shapefile' successful.
1: ne_10m_admin_0_countries (Polygon)
```

`ogrinfo` has printed a message telling us that it successfully read the file, followed by a numbered list of layers in the file. In this case, there is only a single layer, `ne_10m_admin_0_countries`, which is a [polygon]().

The same `ogrinfo` command will work for the `.shx` and `.dbf` format files, but it won't work for the `.cpg` or `.prj` files. You can get a full list of the formats `ogrinfo` can read [here](http://www.gdal.org/ogr_formats.html).
