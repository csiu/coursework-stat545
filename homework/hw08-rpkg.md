# HW: create an R package
csiu  
November 19, 2015  

----

In this [homework-assignment](http://stat545-ubc.github.io/hw10_package.html), we made an R package  called [`foofactor`](https://github.com/csiu/foofactor).

----

## Homework checklist + comments

**What we have already done**

- [x] Set up the directory structure for a package using `devtools::create()`
- [x] put it under version control with `use_git()`
- [x] define functions, such as `fbind()` and `freq_out()`, in the scripts `R/fbind.R` and `R/freq_out.R`, respectively
- [x] use `load_all()` to quickly simulate package build + install
- [x] use `check()` to run R CMD check
- [x] use “Build & Reload” to properly build and install the package
- [x] edit the `DESCRIPTION` file of package metadata
- [x] specify a `LICENSE`
- [x] document and export the functions `fbind()` and `freq_out()` via roxygen2 comments
- [x] create documentation and manage the `NAMESPACE` file via document()
- [x] use `testthat` to implement unit testing
- [x] use a function from another package via `use_package()` and syntax like `otherpkg::foofunction()`
- [x] connect your local Git repo to a new remote on GitHub via `use_github()`
- [x] create a `README.md` that comes from rendering README.Rmd containing actual usage, via use_readme()
- [x] create a vignette via `use_vignette()` and build it via `build_vignettes()`

**The mission**

- [x] Define and export at least one new function, i.e. make it available to a user. We’d prefer more than one. Feel free to improve (or delete) the functions we already have.
    - added `should_factor_stay_factor()`
    - improved `fbind()` to include sorting of the factor levels
    - improved `freq_out()` to include sorting by frequency column
- [x] Give function arguments sensible defaults, where relevant.
    - `fbind(... level.as.appears = TRUE)` 
    - `freq_out(... n.sort = NULL)`
- [x] Use assertions to add some validity checks of function input.
    - made unit test to test that the input of `should_factor_stay_factor()` should be factor
- [x] Document all exported functions.
    - yes
- [x] Include at least three unit tests for every function that is exported.
    - `fbind()`
        1. will binds factors correctly
        2. levels are ordered as they appear
        3. will result to NA if input is not factor
    - `freq_out()`
        1. will creates a frequency table correctly
        2. sorting (e.g. by ascending/descending/null) of the frequency table is correct 
        3. will give a warning if the user specifies a sorting option not on the list 
    - `should_factor_stay_factor()`
        1. will return TRUE if # unique values != length
        2. will return FALSE if # unique values == lenght
        3. the input is a factor
- [x] There should be at least one expectation for success and one for failure.
    - yes
- [x] Your package should pass `check()` without errors (warnings and notes are OK, though it would be great if there were none).
    - success is glorious!!
- [x] Keep updating the `README` and vignette to show usage of all the functions in the package. Your peer reviwer and TA will only have the README and vignette to go on when they try to use your package. Show them exactly what they can do! Remove boilerplate content from the vignette.
    - [README](https://github.com/csiu/foofactor/blob/master/README.md)
    - `vignette("foofactor", package = "foofactor")`
- [x] Push your package to GitHub, preferably a public repo. If you are uncomfortable with that, please contact Jenny and we’ll work around that. 
    - [foofactor](https://github.com/csiu/foofactor) is public ... <strike>if only I had private repos</strike>...
- [x] Write your reflections in a document in your normal STAT 545 course repo and open the usual issue there. Make sure to provide a link to your package, so TAs/prof/peers can find it for review!
    - Below ;)

## Reflection
Overall, I think this is a very useful homework assignment for any student to do. Not only does it coax us to create a *working* R package, but it also provides us a tool and centralized resource to encourage the development of any other R packages we can imagine. 

In my packge [`foofactor`](https://github.com/csiu/foofactor), I included example data: `exampleFactor1`, `exampleFactor2`, and `exampleFactor3`. This was so that I can quickly refer to some example factors in the README/vignette without specifying something ugly (and not the point) like `iris$Species[c(1, 51, 101)]`. 

> **\[TIP]** One can include example data by `devtools::use_data(robj)` to save the example data to `data/robj.rda` where it can be loaded with the package is installed -- by the way, it is awesome!

Furthermore, in order for people to be able to actually use the dataset, one needs to mention the dataset in the `data/` directory. This therefore meant we need to [document the datasets](http://r-pkgs.had.co.nz/data.html).

In my package I have included a standard [readme](https://github.com/csiu/foofactor/blob/master/README.md) as well as a [vignette](https://github.com/csiu/foofactor/blob/master/vignettes/foofactor.Rmd) which is *more verbose than my readme*. In my vignette, I have display all the options of my functions. You can view the vignette (with its output) by running `vignette("foofactor", package = "foofactor")`.

> **\[RESOURCE]** [Vignettes: long-form documentation](http://r-pkgs.had.co.nz/vignettes.html) -- by Hadley Wickham

`devtools` in combination with git made developing an R package easy. With git, we are able to see what files are updated once a devtool function is ran; e.g. after running `document()`, we can see that files in `man/*Rd` may be updated.

Furthermore, I'm glad Jenny introduced `devtools`. I recall that prior to `devtools`, we used `roxygen2` to update documentation (... or worse ... to update each file hand). Now, the use of roxygen is nicely wrapped up with `devtools::document()`. 

#### Extra
- In addition to `foofactor`, I also created another package called [`candysurvey`](https://github.com/csiu/candysurvey) which contains the candy survey data I tidied from the past weeks. In this package, I also created some unit tests to validate that I imported data correctly (e.g. no strangeness when I convert from factor to integer data for i.e. `age` and `n_mints` variables). 

