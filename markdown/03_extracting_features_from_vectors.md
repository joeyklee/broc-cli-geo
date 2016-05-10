## Extracting features from vector files

We can get a closer look at the data in a vector data file by extracting a specific feature:

```
$ ogrinfo countries/ne_10m_admin_0_countries.shp ne_10m_admin_0_countries -fid 1 -q
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

Here we used `-fid 1` to ask for just the *first* feature, which turned out to be the country Afghanistan. If we wanted the *second* feature, we would use `-fid 2`, the *third* would be `-fid 3` and so on.

We also used `-q` to tell `ogrinfo` to be 'quiet', meaning it doesn't print out summary information about the whole file. Try the command without the `-q` to see the difference.

We could have asked `ogrinfo` to do the same thing in a different way, by using an [SQL query](https://www.codecademy.com/learn/learn-sql) to specify the column:

```
$ ogrinfo countries/ne_10m_admin_0_countries.shp -sql 'SELECT * FROM ne_10m_admin_0_countries' -fid 1 -q
```

This might not seem useful, but the SQL query language allows us to ask all kinds of interesting questions.
