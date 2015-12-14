#' Capture a token, or not
#'
#' Create a token to capture or not.
#' @param x A character vector.
#' @return A character vector representing part or all of a regular expression.
#' @references \url{http://www.regular-expressions.info/brackets.html}
#' @examples
#' x <- "foo"
#' capture(x)
#' group(x)
#' @export
capture <- function(x)
{
  regex("(", x, ")")
}

#' @rdname capture
#' @export
group <- function(x)
{
  regex("(?:", x, ")")
}

#' @rdname capture
#' @export
token <- function(x)
{
  .Deprecated("group")
  group(x)
}

#' @rdname capture
#' @param capture Logical If \code{TRUE}, call \code{capture}; if \code{FALSE},
#' call \code{group}.
#' @export
engroup <- function(x, capture)
{
  switch(
    as.character(capture),
    "TRUE"  = capture(x),
    "FALSE" = group(x),
    regex(x)
  )
}
