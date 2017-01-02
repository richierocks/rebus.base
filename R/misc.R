#' @rdname Anchors
#' @export
exactly <- function(x)
{
  regex(START, x, END)
}

#' @rdname WordBoundaries
#' @export
whole_word <- function(x)
{
  regex(BOUNDARY, x, BOUNDARY)
}

#' Treat part of a regular expression literally
#'
#' Treats its contents as literal characters. Equivalent to using
#' \code{fixed = TRUE}, but for part of the pattern rather than all of it.
#' @param x A character vector.
#' @return A character vector representing part or all of a regular expression.
#' @examples
#' (rx <- digit(1, 3))
#' (rx_literal <- literal(rx))
#'
#' # Usage
#' stringi::stri_detect_regex("123", rx)
#' stringi::stri_detect_regex("123", rx_literal)
#' stringi::stri_detect_regex("[[:digit:]]{1,3}", rx_literal)
#' @export
literal <- function(x)
{
  regex("\\Q", x, "\\E")
}

