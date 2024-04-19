
<!-- README.md is generated from README.Rmd. Please edit that file -->

# printMat

Provides basic functions to make it more easy to work with big matrices
with long names.

## Installation

You can install the development version of printMat like so:

``` r
remotes::install_github("AlexWeinreb/printMat")
```

## head

R’s defaults `print()` and `head()` attempt to print everything, filling
the console. `mathead()` will trim names if necessary and only print the
top-left corner of a matrix.

``` r
library(printMat)
mat <- matrix(runif(50*60), nrow = 50)
rownames(mat) <- c("qwertyuiopasdfghjkl", "123456789123456789") |> rep(25)
mathead(mat)
#> matrix of double :  50 60 
#>                      [,1]      [,2]      [,3]      [,4]
#> qwertyuiopas... 0.2437014 0.4128140 0.7834996 0.3617683
#> 123456789123... 0.2782278 0.1877616 0.2665647 0.5295707
#> qwertyuiopas... 0.3414106 0.8647999 0.9611887 0.2405546
#> 123456789123... 0.5448317 0.0993962 0.6336139 0.2769193
```

You can use it to overwrite the default `utils:::head.matrix()`:

``` r
usethis::edit_r_profile()

# and add
head.matrix <- printMat::mathead
```

# image

For big matrices, the default `image()` takes a while to render, and
inverts the coordinates, `matimage()` is a small wrapper. It largely
reuses the code of `imageM()` in the examples of `?image`.
