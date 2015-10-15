# tidy data & reshape
csiu  
October 15, 2015  

- [lecture outline](http://stat545-ubc.github.io/cm012_tidy-data-factors.html)


```r
suppressPackageStartupMessages(library(dplyr))
```

- [examples of good peer reviews and homework](https://github.com/STAT545-UBC/2015_pvt-to-students-and-staff)

### Pass arguments as strings
- `aes_string()` ... allows you to pass string in
- `summarise(mtcars, mean(mpg))` is the same as `summarise_(mtcars, "mean(mpg)")` -- not the underscore

--- 

## Tidying data
### The dataset
- `EDAWR` - r packages with all of the data sets that will be used today

```r
# install.packages("devtools")
# devtools::install_github("rstudio/EDAWR")

library(EDAWR)
?storms
?cases
?pollution
```

### The package
- `tidyr` (package for tidying data) is a subset of `reshape2`


```r
library(tidyr)
```

- `tidyr::gather()` - need to specify KEY and VALUE variable
- `tidyr::spread()` 
    - specify which is the KEY variable ... destined to be new column names 
    - specify which is the VALUE variable ... destined to be values

### Example of `gather()`

```r
cases
```

```
##   country  2011  2012  2013
## 1      FR  7000  6900  7000
## 2      DE  5800  6000  6200
## 3      US 15000 14000 13000
```

```r
cases %>% gather(year, n, -country)
```

```
##   country year     n
## 1      FR 2011  7000
## 2      DE 2011  5800
## 3      US 2011 15000
## 4      FR 2012  6900
## 5      DE 2012  6000
## 6      US 2012 14000
## 7      FR 2013  7000
## 8      DE 2013  6200
## 9      US 2013 13000
```

```r
gather(cases, "year", "n", 2:4) ##2:4 <- which columns you want to stack up
```

```
##   country year     n
## 1      FR 2011  7000
## 2      DE 2011  5800
## 3      US 2011 15000
## 4      FR 2012  6900
## 5      DE 2012  6000
## 6      US 2012 14000
## 7      FR 2013  7000
## 8      DE 2013  6200
## 9      US 2013 13000
```

```r
gather(cases, "year", "n", one_of("2011", "2012", "2013"))
```

```
##   country year     n
## 1      FR 2011  7000
## 2      DE 2011  5800
## 3      US 2011 15000
## 4      FR 2012  6900
## 5      DE 2012  6000
## 6      US 2012 14000
## 7      FR 2013  7000
## 8      DE 2013  6200
## 9      US 2013 13000
```

### Example of `spread()`

```r
pollution
```

```
##       city  size amount
## 1 New York large     23
## 2 New York small     14
## 3   London large     22
## 4   London small     16
## 5  Beijing large    121
## 6  Beijing small     56
```

```r
spread(pollution, "size", "amount")
```

```
##       city large small
## 1  Beijing   121    56
## 2   London    22    16
## 3 New York    23    14
```

### Other handy functions: `separate()` and `unite()`
- `tidyr::separate()`

```r
storms
```

```
## Source: local data frame [6 x 4]
## 
##     storm  wind pressure       date
##     (chr) (int)    (int)     (date)
## 1 Alberto   110     1007 2000-08-03
## 2    Alex    45     1009 1998-07-27
## 3 Allison    65     1005 1995-06-03
## 4     Ana    40     1013 1997-06-30
## 5  Arlene    50     1010 1999-06-11
## 6  Arthur    45     1010 1996-06-17
```

```r
(storms2 <- separate(storms, date, c("year", "month", "day"), sep="-"))
```

```
## Source: local data frame [6 x 6]
## 
##     storm  wind pressure  year month   day
##     (chr) (int)    (int) (chr) (chr) (chr)
## 1 Alberto   110     1007  2000    08    03
## 2    Alex    45     1009  1998    07    27
## 3 Allison    65     1005  1995    06    03
## 4     Ana    40     1013  1997    06    30
## 5  Arlene    50     1010  1999    06    11
## 6  Arthur    45     1010  1996    06    17
```

- `tidyr::unite()`

```r
unite(storms2, date, year, month, day, sep="-")
```

```
## Source: local data frame [6 x 4]
## 
##     storm  wind pressure       date
##     (chr) (int)    (int)      (chr)
## 1 Alberto   110     1007 2000-08-03
## 2    Alex    45     1009 1998-07-27
## 3 Allison    65     1005 1995-06-03
## 4     Ana    40     1013 1997-06-30
## 5  Arlene    50     1010 1999-06-11
## 6  Arthur    45     1010 1996-06-17
```
