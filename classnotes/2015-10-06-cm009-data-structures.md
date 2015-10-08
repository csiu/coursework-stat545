# Day09: data structures
csiu  
2015-10-06  

- `dplr` - domain specific language
- [lecture outline](http://stat545-ubc.github.io/cm009_r-objects-collections.html)

```
+-----------+---------------+-----------+-----------+
| "flavor"  | type reported | mode()    | class()   |
|           | by typeof()   |           |           |
+===========+===============+===========+===========+
| character | character     | character | character |
+-----------+---------------+-----------+-----------+
| logical   | logical       | logical   | logical   |
+-----------+---------------+-----------+-----------+
| numeric   | integer       | numeric   | integer   |
|           | or double     |           | or double |
+-----------+---------------+-----------+-----------+
| factor    | integer       | numeric   | factor    |
+-----------+---------------+-----------+-----------+
```

### intrinsic vector nature of R

```r
x <- 3 * 4   ## [1] 12
is.vector(x) ## [1] TRUE
length(x)    ## [1] 1


x[2] <- 100  ## [1]  12 100
x[5] <- 3    ## [1]  12 100  NA  NA   3
x[11]        ## [1] NA
x[0]         ## numeric(0)
```


```r
x <- 1:4

#======#
# GOOD #
#======#
y <- x^2

#=====#
# BAD #
#=====#
## or the for loop version?
z <- vector(mode = mode(x), length = length(x)) #intialize: should be mode of x and length of x
for(i in seq_along(x)) {
  z[i] <- x[i]^2 #assign
}

#===============#
identical(y, z)
```

```
## [1] TRUE
```

### mean and standard deviation of random normal variates can be provided as vectors

```r
set.seed(1999)
rnorm(5, mean = 10^(1:5))
round(rnorm(5, sd = 10^(0:4)), 2)
```

### R also recycles vectors

```r
y <- 1:3 ## 1 2 3
z <- 3:7 ## 3 4 5 6 7
y + z
```

```
## Warning in y + z: longer object length is not a multiple of shorter object
## length
```

```
## [1] 4 6 8 7 9
```
... but if one variable is a factor of another, then get no warnings

### Indexing a vector
Most common, useful ways to index a vector

- logical vector: keep elements associated with TRUEs, ditch the FALSEs
- vector of positive integers specifying the keepers
- vector of negative integers specifying the losers
- character vector, naming the keepers

### lists hold just about anything
- data.frames are lists!

### Indexing arrays, e.g. matrices
- array & matrices ... each element has to be the same flavor

- vector vs list
- matrix vs data.frame


```r
data.frame(x=1:3, y=1:6) ##recycling
```

```
##   x y
## 1 1 1
## 2 2 2
## 3 3 3
## 4 1 4
## 5 2 5
## 6 3 6
```

```r
dplyr::data_frame(x=1:3, y=1:6) ##dplyr does not allow recycling
```

```
## Error in data_frame_(lazyeval::lazy_dots(...)): arguments imply differing number of rows: 3, 6
```

```r
dplyr::data_frame(x= rep(1:3, 2), y=1:6) ##need to explicitly do it
```

```
## Source: local data frame [6 x 2]
## 
##       x     y
##   (int) (int)
## 1     1     1
## 2     2     2
## 3     3     3
## 4     1     4
## 5     2     5
## 6     3     6
```

> The drop = argument controls whether the return value should be an atomic vector (`drop = TRUE`) or a matrix with a single row or column (`drop = FALSE`). 


```r
jMat <- outer(as.character(1:4), as.character(1:4),
              function(x, y) {
                paste0('x', x, y)
                })
jMat[ , 3]
```

```
## [1] "x13" "x23" "x33" "x43"
```

```r
jMat[ , 3, drop = FALSE] # getting column 3
```

```
##      [,1] 
## [1,] "x13"
## [2,] "x23"
## [3,] "x33"
## [4,] "x43"
```
