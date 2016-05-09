## Advanced feature extraction from vector files

Using SQL we can ask `ogrinfo` for any kind of subset or summary of the data in a vector file. Let's look at some interesting examples.

> NOTE: learning SQL is beyond the scope of this tutorial, but you can read more on the [OGR SQL](http://www.gdal.org/ogr_sql.html) site.

We can filter the features in a file by selecting those where a field meets a condition. We do this by using `ogrinfo filename -sql`, followed by a query with this format:

> "SELECT * FROM {layer} WHERE {condition}"

i.e with to find all the features in ne_10m_admin_0_countries where the NAME is 'Afghanistan', we would use:

> "SELECT * FROM ne_10m_admin_0_countries WHERE SOVEREIGNT = 'Afghanistan'"

Let's try it:

```
$ ogrinfo data/ne_10m_admin_0_countries.shp -q \
  -sql "SELECT * FROM ne_10m_admin_0_countries WHERE SOVEREIGNT = 'Afghanistan'"
  Layer name: ne_10m_admin_0_countries
  OGRFeature(ne_10m_admin_0_countries):1
    scalerank (Integer) = 0
    featurecla (String) = Admin-0 country
    LABELRANK (Real) = 3.00
    SOVEREIGNT (String) = Afghanistan
    SOV_A3 (String) = AFG
    ADM0_DIF (Real) = 0.00
    LEVEL (Real) = 2.00
...
```

When doing advanced filtering, it helps to hide the POLYGON line from the result and page gradually through the output. You can do this by piping the output through [`grep`](https://en.wikipedia.org/wiki/Grep) and [`less`](https://en.wikipedia.org/wiki/Less_(Unix)):

```
ogrinfo data/ne_10m_admin_0_countries.shp -q \
  -sql "SELECT * FROM ne_10m_admin_0_countries" \
  | grep -v POLYGON | less
```

Here, `grep -v` means 'hide lines that match the filter'.

Here are some other queries you can try that should help you see some of the power of SQL:

All fields for all countries in Africa

```
SELECT * FROM ne_10m_admin_0_countries WHERE CONTINENT = 'Africa'
```

Just the name and polygon for all countries in Africa

```
SELECT NAME FROM ne_10m_admin_0_countries WHERE CONTINENT = 'Africa'
```

Just name and polygon for countries **not** in Africa

```
SELECT NAME FROM ne_10m_admin_0_countries WHERE CONTINENT != 'Africa'
```

Name, population estimate and polygon for countries with a population over 10 million, sorted by descending population

```
SELECT NAME, POP_EST FROM ne_10m_admin_0_countries WHERE POP_EST > 10000000 ORDER BY POP_EST DESC
```
