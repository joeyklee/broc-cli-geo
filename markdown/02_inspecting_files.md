## Summarising vector files

We can use `ogrinfo` to get more detailed information about a layer in a vector data file.

By passing the name of a layer, and using the `-so` flag, we can ask `ogrinfo` to display summary information about a layer.

```
$ ogrinfo -so data/ne_10m_admin_0_countries.shp ne_10m_admin_0_countries
INFO: Open of `data/ne_10m_admin_0_countries.shp'
      using driver `ESRI Shapefile' successful.

Layer name: ne_10m_admin_0_countries
Geometry: Polygon
Feature Count: 255
Extent: (-180.000000, -90.000000) - (180.000000, 83.634101)
Layer SRS WKT:
GEOGCS["GCS_WGS_1984",
    DATUM["WGS_1984",
        SPHEROID["WGS_84",6378137.0,298.257223563]],
    PRIMEM["Greenwich",0.0],
    UNIT["Degree",0.0174532925199433]]
scalerank: Integer (4.0)
featurecla: String (30.0)
LABELRANK: Real (6.2)
SOVEREIGNT: String (32.0)
SOV_A3: String (3.0)
ADM0_DIF: Real (4.2)
...
```

Some basic infomation is given (the geometry, boundary extent, the [spatial reference system](https://en.wikipedia.org/wiki/Spatial_reference_system)).

You can also see that file contains 255 features, and for each feature the following information is listed.

- the name of the feature
- its type `Integer`, `String`, `Real`, etc.
- its length

Just to be clear, here's one of the lines with the pieces annotated:

```
  name     type    length
    |        |       |
scalerank: Integer (4.0)
```
