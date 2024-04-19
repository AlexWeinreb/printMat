
#' Quick plotting of matrix
#'
#' Plot a matrix using `image` with raster and replotting axes. Adapted from `imageM()` in the examples of `?image`.
#'
#' @param mat the matrix to plot
#' @param ... parameters passed to `image`
#'
#' @return the original matrix invisibly
#' @export
#'
matimage <- function(mat, ...){
    graphics::image(t(mat)[, nrow(mat):1], useRaster = TRUE, axes = FALSE, ...)

    mAxis <- function(side, at, ...)
      graphics::axis(side, at=at, labels=as.character(j+1L), col="gray", col.axis=1)

    n <- ncol(mat); n1 <- n-1L; j <- 0L:n1; mAxis(1, at= j/n1)

    n <- nrow(mat); n1 <- n-1L; j <- 0L:n1; mAxis(2, at=1-j/n1, las=1)

    invisible(mat)
}
