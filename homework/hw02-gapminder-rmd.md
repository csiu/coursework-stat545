# Homework 02: Explore Gapminder and use R markdown
csiu  
2015-09-24  

- Link to [Homework 02](http://stat545-ubc.github.io/hw02_explore-gapminder-use-rmarkdown.html)


```r
library(ggplot2)
```


## Bring rectangular data in
> - Load the Gapminder data with both functions without specifying args other than file. Do you get the same resulting object in your workspace? Use all the ways we’ve learned to inspect an object to back up your claims with hard facts.


```r
datafile <- "../data/gapminder.txt"

data      <- read.delim(datafile)
datatable <- read.table(datafile)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 146 did not have 6 elements
```

Unlike `read.delim`, running `read.table` without any arguments will result to an error. One of the reason is because "`line 146 did not have 6 elements`".


```r
data[146,]
```

```
##                    country year     pop continent lifeExp gdpPercap
## 146 Bosnia and Herzegovina 1957 3076000    Europe   58.45  1353.989
```

> - If you’re not getting the same object, why not?

They are not the same object because `read.delim` results to a R object, whereas `read.table` does not (i.e. an error appears instead).

> - Develop the call to read.table() that is equivalent to read.delim(), i.e. how do you need to set various arguments and describe this in prose as well.

To do this, we need to specify `header=TRUE, sep="\t", quote="\""` i.e.

```r
datatable <- read.table(datafile, header=TRUE, sep="\t", quote="\"")
str(datatable)
```

```
## 'data.frame':	1704 obs. of  6 variables:
##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
##  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
##  $ gdpPercap: num  779 821 853 836 740 ...
```

```r
str(data)
```

```
## 'data.frame':	1704 obs. of  6 variables:
##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
##  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
##  $ gdpPercap: num  779 821 853 836 740 ...
```
The number of dimensions in both objects are now the same. Regardless, the moral of the story -- in my opinion -- is that `read.delim` is far superior to `read.table`.

## Smell test the data
> - Is it a data.frame, a matrix, a vector, a list?

The imported `data` object is a data.frame

> - What’s its mode, class?


```r
(data_mode <- mode(data))
```

```
## [1] "list"
```

```r
(data_class <- class(data))
```

```
## [1] "data.frame"
```

> - How many variables?


```r
(data_ncol <- ncol(data))
```

```
## [1] 6
```

> - How many rows/observations?


```r
(data_nrow <- nrow(data))
```

```
## [1] 1704
```

> - Can you get these facts about “extent” or “size” in more than one way? Can you imagine different functions being useful in different contexts?


```r
(data_dim <- dim(data))
```

```
## [1] 1704    6
```

> - What flavor is each the variable?

```r
str(data_mode)
```

```
##  chr "list"
```

```r
str(data_class)
```

```
##  chr "data.frame"
```

```r
str(data_nrow)
```

```
##  int 1704
```

```r
str(data_ncol)
```

```
##  int 6
```

```r
str(data_dim)
```

```
##  int [1:2] 1704 6
```

## Explore individual variables
> - Characterize what’s possible, i.e. all possible values or max vs. min … whatever’s appropriate.
> - What’s typical? What’s the spread? What’s the distribution? Etc., tailored to the variable at hand.
> - Feel free to use summary stats, tables, figures. We’re NOT expecting high production value (yet).

### categorical variable == `"continent"`

```r
## All possible values of continent
levels(data$continent)
```

```
## [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"
```

```r
## Number of observations per continent per year
table(data$continent, data$year)
```

```
##           
##            1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 2002 2007
##   Africa     52   52   52   52   52   52   52   52   52   52   52   52
##   Americas   25   25   25   25   25   25   25   25   25   25   25   25
##   Asia       33   33   33   33   33   33   33   33   33   33   33   33
##   Europe     30   30   30   30   30   30   30   30   30   30   30   30
##   Oceania     2    2    2    2    2    2    2    2    2    2    2    2
```

```r
## Since the number of observation per continent per year is the same across years,
## I will make a plot with the observations per continent in 2007
ggplot(with(data, subset(data, subset = (year == "2007"))),
       aes(x=continent, y=..count..)) +
  geom_bar()
```

![](figure/hw02-unnamed-chunk-10-1.png) 

We have the most data from Africa.

### quantitiative variable == `"lifeExp"`

```r
summary(data$lifeExp)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   23.60   48.20   60.71   59.47   70.85   82.60
```

```r
g <- ggplot(data, aes(x=lifeExp, y=..density..)) +
  geom_histogram(binwidth=1, fill="grey") +
  geom_density()
g
```

![](figure/hw02-unnamed-chunk-11-1.png) 

```r
g + facet_wrap(~ year)
```

![](figure/hw02-unnamed-chunk-11-2.png) 

We are living longer! (Immortality, here we come!)

## Extra
### A look at global life expectancy in 2007

```r
ggplot(with(data, subset(data, subset = (year == "2007"))),
       aes(x=log(pop),
           y=log(gdpPercap),
           label=country,
           color=lifeExp,
           size=lifeExp
           )) +
  geom_point() +
  geom_text(hjust=0, vjust=0, size=3) +
  scale_size_continuous(guide=guide_legend(reverse=TRUE)) +
  scale_color_gradient(low="yellow", high="blue")
```

![](figure/hw02-unnamed-chunk-12-1.png) 

Here we see that as gdp per capita goes up, so does life expectancy. On the other hand, when the population size changes, life expectancy (as well as gdp per capita) does not change.

### A closer look at countries in Americas through time
_Note: I focus on this subset because this is the continent I -- someone of Generation Me Me Me -- live on._

```r
data_americas <- with(data,
                      subset(data, subset = (continent == "Americas")))

## Countries in Americas:
unique(as.character(data_americas$country))
```

```
##  [1] "Argentina"           "Bolivia"             "Brazil"             
##  [4] "Canada"              "Chile"               "Colombia"           
##  [7] "Costa Rica"          "Cuba"                "Dominican Republic" 
## [10] "Ecuador"             "El Salvador"         "Guatemala"          
## [13] "Haiti"               "Honduras"            "Jamaica"            
## [16] "Mexico"              "Nicaragua"           "Panama"             
## [19] "Paraguay"            "Peru"                "Puerto Rico"        
## [22] "Trinidad and Tobago" "United States"       "Uruguay"            
## [25] "Venezuela"
```

```r
p <- ggplot(data_americas,
       aes(x=log(pop),
           y=log(gdpPercap),
           label=country,
           color=lifeExp,
           size=lifeExp
           )) +
  geom_point() +
  geom_text(hjust=0, vjust=0, size=2, color="black") +
  scale_size_continuous(guide=guide_legend(reverse=TRUE)) +
  scale_color_gradient(low="yellow", high="blue")
```


```r
p + facet_grid(year ~ .)
```

![](figure/hw02-unnamed-chunk-14-1.png) 

Here we see that population size tends to increase in the Americas.


```r
p + facet_grid(. ~ year)
```

![](figure/hw02-unnamed-chunk-15-1.png) 

Here we see that the spread of gdp per capita between the richest and poorest countries tends to increase. We also see that life expectancy tends to get longer too.

## Report your process
I thought this assignment was pretty fun and easy. It also helps that I am familiar with R and have used `ggplot2` before. Upon looking at the data, I am also somewhat surprised that the range in GDP is getting bigger in the Americas.
