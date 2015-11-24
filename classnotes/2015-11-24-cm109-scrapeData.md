# getting data off the internet
csiu  
November 24, 2015  

```r
suppressPackageStartupMessages(library(dplyr))
```

- [outline](http://stat545-ubc.github.io/cm109_data-from_web.html)
- [activity](http://stat545-ubc.github.io/webdata02_activity.html)

- dplyr tip: `{ ... }` <- don't pass in as first argument  ... only at dot

## [Get data off internet](http://stat545-ubc.github.io/webdata01_slides.html#1)
1. click and download
2. install and play e.g. R package
3. API query - what kind of Q can computer ask
4. scrape

> [ropensci](https://ropensci.org) - look at packages ... community of people getting data off the internet

### Example of install and play

```r
# install.packages("gender")

library(gender)
gender("Andrew")
```

```
## Source: local data frame [1 x 6]
## 
##     name proportion_male proportion_female gender year_min year_max
##    (chr)           (dbl)             (dbl)  (chr)    (dbl)    (dbl)
## 1 Andrew           0.996             0.004   male     1932     2012
```
```
> gender("Andrew")
The genderdata package needs to be installed.
Install the genderdata package? 

1: Yes
2: No
```

- `lazyload` -- not load data in ram until use

### packages 
- is it a boy or a girl? `gender`
- Sightings of birds: `rebird`
- Searching geographic info: `geonames`
    - http://www.geonames.org
    - Geonames also helps us search Wikipedia.


```r
library(geonames)
#> No geonamesUsername set. See http://geonames.wordpress.com/2010/03/16/ddos-part-ii/ and set one with options(geonamesUsername="foo") for some services to work

## Need to set username
# options(geonamesUsername="?????")
## Put in .Rprofile

GNwikipediaSearch("London") %>%
  select(-summary) %>%
    head %>%
    knitr::kable(format = "markdown")
```



|elevation |geoNameId |feature |lng                 |countryCode |rank |thumbnailImg                                                      |lang |title                                  |lat               |wikipediaUrl                                                 |
|:---------|:---------|:-------|:-------------------|:-----------|:----|:-----------------------------------------------------------------|:----|:--------------------------------------|:-----------------|:------------------------------------------------------------|
|2         |2643741   |city    |-0.07857            |GB          |100  |http://www.geonames.org/img/wikipedia/43000/thumb-42715-100.jpg   |en   |London                                 |51.504872         |en.wikipedia.org/wiki/London                                 |
|262       |6058560   |city    |-81.2497            |CA          |100  |http://www.geonames.org/img/wikipedia/58000/thumb-57388-100.jpg   |en   |London, Ontario                        |42.9837           |en.wikipedia.org/wiki/London%2C_Ontario                      |
|60        |1006984   |city    |27.9036078333333    |ZA          |100  |http://www.geonames.org/img/wikipedia/138000/thumb-137098-100.jpg |en   |East London, Eastern Cape              |-33.0145668333333 |en.wikipedia.org/wiki/East_London%2C_Eastern_Cape            |
|14        |NA        |adm1st  |-0.0159638888888889 |GB          |98   |http://www.geonames.org/img/wikipedia/157000/thumb-156609-100.jpg |en   |London Borough of Lewisham             |51.4568777777778  |en.wikipedia.org/wiki/London_Borough_of_Lewisham             |
|27        |4839416   |NA      |-72.1008333333333   |US          |100  |http://www.geonames.org/img/wikipedia/160000/thumb-159123-100.jpg |en   |New London, Connecticut                |41.3555555555556  |en.wikipedia.org/wiki/New_London%2C_Connecticut              |
|13        |NA        |adm1st  |-0.303547222222222  |GB          |100  |http://www.geonames.org/img/wikipedia/146000/thumb-145782-100.jpg |en   |London Borough of Richmond upon Thames |51.4613416666667  |en.wikipedia.org/wiki/London_Borough_of_Richmond_upon_Thames |

- Searching the Public Library of Science: `rplos`
