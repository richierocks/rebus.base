#' Apply mode modifiers
#'
#' Applies one or more mode modifiers to the regular expression.
#' @param x A character vector.
#' @param modes A character vector of mode modifiers.
#' @return A character vector representing part or all of a regular expression.
#' @references \url{http://www.regular-expressions.info/modifiers.html} and
#' \url{http://www.rexegg.com/regex-modifiers.html}
#' @examples
#' x <- "foo"
#' case_insensitive(x)
#' free_spacing(x)
#' single_line(x)
#' multi_line(x)
#' duplicate_group_names(x)
#' no_backslash_escaping(x)
#' modify_mode(x, c("i", "J", "X"))
#' @include regex-methods.R
#' @export
modify_mode <- function(x, modes = c("i", "x", "s", "m", "J", "X"))
{
  modes <- paste0(match.arg(modes, several.ok = TRUE), collapse = "")
  regex("(?", modes, ")", x, "(?-", modes, ")")
}

#' @rdname modify_mode
#' @export
case_insensitive <- function(x)
{
  modify_mode(x, "i")
}

#' @rdname modify_mode
#' @export
free_spacing <- function(x)
{
  modify_mode(x, "x")
}

#' @rdname modify_mode
#' @export
single_line <- function(x)
{
  modify_mode(x, "s")
}

#' @rdname modify_mode
#' @export
multi_line <- function(x)
{
  modify_mode(x, "m")
}

#' @rdname modify_mode
#' @export
duplicate_group_names <- function(x)
{
  modify_mode(x, "J")
}

#' @rdname modify_mode
#' @export
no_backslash_escaping <- function(x)
{
  modify_mode(x, "X")
}

#' Force the case of replacement values
#'
#' Forces replacement values to be upper or lower case. Only supported by Perl
#' regular expressions.
#' @param x A character vector.
#' @return A character vector representing part or all of a regular expression.
#' @references \url{http://www.regular-expressions.info/replacecase.html}
#' @examples
#' # Convert to title case using Perl regex
#' x <- "In caSE of DISASTER, PuLl tHe CoRd"
#' matching_rx <- capture(WRD) %R% capture(wrd(1, Inf))
#' replacement_rx <- as_upper(REF1) %R% as_lower(REF2)
#' gsub(matching_rx, replacement_rx, x, perl = TRUE)
#'
#' # PCRE and ICU do not currently support this operation
#' # The next lines are intended to return gibberish
#' gsub(matching_rx, replacement_rx, x)
#' replacement_rx_icu <- as_upper(ICU_REF1) %R% as_lower(ICU_REF2)
#' stringi::stri_replace_all_regex(x, matching_rx, replacement_rx_icu)
#' @name ReplacementCase
#' @export
as_lower <- function(x)
{
  regex("\\L", x, "\\E")
}

#' @rdname ReplacementCase
#' @export
as_upper <- function(x)
{
  regex("\\U", x, "\\E")
}
