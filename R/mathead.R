
#' head of a matrix
#'
#' similar to `head()` but does not attempt to print big matrices
#'
#' @param x the matrix to print
#' @param ... ignored
#'
#' @return the original matrix (invisibl)
#' @export
#'
#' @examples
#' mat <- matrix(runif(50*60), nrow = 50)
#' rownames(mat) <- c("qwertyuiopasdfghjkl", "123456789123456789") |> rep(25)
#' mathead(mat)
mathead <- function(x, ...){

  x1 <- x

  colnames_too_long <- nchar(colnames(x1)) > 15
  toolongcol <- colnames(x1)[colnames_too_long]
  toolongcol <- substr(toolongcol, 1, 12) |> paste0("...")
  colnames(x1)[colnames_too_long] <- toolongcol

  rownames_too_long <- nchar(rownames(x1)) > 15
  toolongrow <- rownames(x1)[rownames_too_long]
  toolongrow <- substr(toolongrow, 1, 12) |> paste0("...")
  rownames(x1)[rownames_too_long] <- toolongrow

  if(ncol(x1) < 6){

    utils::head.matrix(x1)
  } else {

    cat("matrix of", typeof(x1),": ", dim(x1), "\n")
    print.default(x1[seq_len(pmin(4, nrow(x1))),
                          seq_len(pmin(4, ncol(x1)))])
    invisible(x)
  }
}
