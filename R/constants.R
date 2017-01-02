#' Special characters
#'
#' Constants to match special characters.
#' @references \url{http://www.regular-expressions.info/characters.html}
#' @seealso \code{\link{escape_special}} for the functional form,
#' \code{\link{CharacterClasses}} for regex metacharacters,
#' \code{\link{Anchors}} for constants to match the start/end of a string,
#' \code{\link{WordBoundaries}} for contants to match the start/end of a word.
#' @examples
#' BACKSLASH
#' CARET
#' DOLLAR
#' DOT
#' PIPE
#' QUESTION
#' STAR
#' PLUS
#' OPEN_PAREN
#' CLOSE_PAREN
#' OPEN_BRACKET
#' CLOSE_BRACKET
#' OPEN_BRACE
#'
#' # Usage
#' x <- "\\^$."
#' rx <- BACKSLASH %R% CARET %R% DOLLAR %R% DOT
#' stringi::stri_detect_regex(x, rx)
#' # No escapes - these chars have special meaning inside regex
#' stringi::stri_detect_regex(x, x)
#'
#' # Usually closing brackets can be matched without escaping
#' stringi::stri_detect_regex("]", "]")
#' # If you want to match a closing bracket inside a character class
#' # the closing bracket must be placed first
#' (rx <- char_class("]a"))
#' stringi::stri_detect_regex("]", rx)
#' # ICU and Perl also allows you to place the closing bracket in
#' # other positions if you escape it
#' (rx <- char_class("a", CLOSE_BRACKET))
#' stringi::stri_detect_regex("]", rx)
#' grepl(rx, "]", perl = TRUE)
#' # PCRE does not allow this
#' grepl(rx, "]")
#' @name SpecialCharacters
#' @include regex-methods.R
NULL

#' @rdname SpecialCharacters
#' @export
BACKSLASH <- as.regex("\\\\")

#' @rdname SpecialCharacters
#' @export
CARET <- as.regex("\\^")

#' @rdname SpecialCharacters
#' @export
DOLLAR <- as.regex("\\$")

#' @rdname SpecialCharacters
#' @export
DOT <- as.regex("\\.")

#' @rdname SpecialCharacters
#' @export
PIPE <- as.regex("\\|")

#' @rdname SpecialCharacters
#' @export
QUESTION <- as.regex("\\?")

#' @rdname SpecialCharacters
#' @export
STAR <- as.regex("\\*")

#' @rdname SpecialCharacters
#' @export
PLUS <- as.regex("\\+")

#' @rdname SpecialCharacters
#' @export
OPEN_PAREN <- as.regex("\\(")

#' @rdname SpecialCharacters
#' @export
CLOSE_PAREN <- as.regex("\\)")

#' @rdname SpecialCharacters
#' @export
OPEN_BRACKET <- as.regex("\\[")

#' @rdname SpecialCharacters
#' @export
CLOSE_BRACKET <- as.regex("\\]")

#' @rdname SpecialCharacters
#' @export
OPEN_BRACE <- as.regex("\\{")

#' The start or end of a string.
#'
#' \code{START} matches the start of a string.
#' \code{END} matches the end of a string.
#' \code{exactly} makes the regular expression match the whole string, from
#' start to end.
#' @param x A character vector.
#' @return A character vector representing part or all of a regular expression.
#' @references \url{http://www.regular-expressions.info/anchors.html} and
#' \url{http://www.rexegg.com/regex-anchors.html}
#' @note Caret and dollar are used as start/end delimiters, since \code{\\A} and
#' \code{\\Z} are not supported by R's internal PRCE engine or \code{stringi}'s
#' ICU engine.
#' @seealso \code{\link{whole_word}} and \code{\link{modify_mode}}
#' @examples
#' START
#' END
#'
#' # Usage
#' x <- c("catfish", "tomcat", "cat")
#' (rx_start <- START %R% "cat")
#' (rx_end <- "cat" %R% END)
#' (rx_exact <- exactly("cat"))
#' stringi::stri_detect_regex(x, rx_start)
#' stringi::stri_detect_regex(x, rx_end)
#' stringi::stri_detect_regex(x, rx_exact)
#' @name Anchors
NULL

#' @rdname Anchors
#' @export
START <- as.regex("^")

#' @rdname Anchors
#' @export
END <- as.regex("$")

#' Class Constants
#'
#' Match a class of values. These are typically used in combination with
#' \code{\link{char_class}} to create new character classes.
#' @seealso \code{\link{ClassGroups}} for the functional form,
#' \code{\link{SpecialCharacters}} for regex metacharacters,
#' \code{\link{Anchors}} for constants to match the start/end of a string,
#' \code{\link{WordBoundaries}} for contants to match the start/end of a word.
#' @examples
#' # R character classes
#' ALNUM
#' ALPHA
#' BLANK
#' CNTRL
#' DIGIT
#' GRAPH
#' LOWER
#' PRINT
#' PUNCT
#' SPACE
#' UPPER
#' HEX_DIGIT
#'
#' # Generic classes
#' ANY_CHAR
#' DGT
#' WRD
#' SPC
#'
#' # Generic negated classes
#' NOT_DGT
#' NOT_WRD
#' NOT_SPC
#'
#' # Non-locale-specific classes
#' ASCII_DIGIT
#' ASCII_LOWER
#' ASCII_UPPER
#' ASCII_ALPHA
#' ASCII_ALNUM
#'
#' # An oxymoron
#' UNMATCHABLE
#'
#' # Usage
#' x <- c("a1 A", "a1 a")
#' rx <- LOWER %R% DIGIT %R% SPACE %R% UPPER
#' stringi::stri_detect_regex(x, rx)
#' @name CharacterClasses
NULL

#' @rdname CharacterClasses
#' @export
ALPHA <- as.regex("[:alpha:]")

#' @rdname CharacterClasses
#' @export
ALNUM <- as.regex("[:alnum:]")

#' @rdname CharacterClasses
#' @export
BLANK <- as.regex("[:blank:]")

#' @rdname CharacterClasses
#' @export
CNTRL <- as.regex("[:cntrl:]")

#' @rdname CharacterClasses
#' @export
DIGIT <- as.regex("[:digit:]")

#' @rdname CharacterClasses
#' @export
GRAPH <- as.regex("[:graph:]")

#' @rdname CharacterClasses
#' @export
LOWER <- as.regex("[:lower:]")

#' @rdname CharacterClasses
#' @export
PRINT <- as.regex("[:print:]")

#' @rdname CharacterClasses
#' @export
PUNCT <- as.regex("[:punct:]")

#' @rdname CharacterClasses
#' @export
SPACE <- as.regex("[:space:]")

#' @rdname CharacterClasses
#' @export
UPPER <- as.regex("[:upper:]")

#' @rdname CharacterClasses
#' @export
HEX_DIGIT <- as.regex("[:xdigit:]")

#' @rdname CharacterClasses
#' @export
ANY_CHAR <- as.regex(".")

#' @rdname CharacterClasses
#' @export
DGT <- as.regex("\\d")

#' @rdname CharacterClasses
#' @export
WRD <- as.regex("\\w")

#' @rdname CharacterClasses
#' @export
SPC <- as.regex("\\s")

#' @rdname CharacterClasses
#' @export
NOT_DGT <- as.regex("\\D")

#' @rdname CharacterClasses
#' @export
NOT_WRD <- as.regex("\\W")

#' @rdname CharacterClasses
#' @export
NOT_SPC <- as.regex("\\S")

#' @rdname CharacterClasses
#' @export
ASCII_DIGIT <- as.regex("0-9")

#' @rdname CharacterClasses
#' @export
ASCII_LOWER <- as.regex("a-z")

#' @rdname CharacterClasses
#' @export
ASCII_UPPER <- as.regex("A-Z")

#' Word boundaries
#'
#' \code{BOUNDARY} matches a word boundary.
#' \code{whole_word} wraps a regex in word boundary tokens to match a whole
#' word.
#' @param x A character vector.
#' @return A character vector representing part or all of a regular expression.
#' @references \url{http://www.regular-expressions.info/wordboundaries.html} and
#' \url{http://www.rexegg.com/regex-boundaries.html}
#' @seealso \code{\link{ALPHA}}, \code{\link{BACKSLASH}}, \code{\link{START}}
#' @examples
#' BOUNDARY
#' NOT_BOUNDARY
#'
#' # Usage
#' x <- c("the catfish miaowed", "the tomcat miaowed", "the cat miaowed")
#' (rx_before <- BOUNDARY %R% "cat")
#' (rx_after <- "cat" %R% BOUNDARY)
#' (rx_whole_word <- whole_word("cat"))
#' stringi::stri_detect_regex(x, rx_before)
#' stringi::stri_detect_regex(x, rx_after)
#' stringi::stri_detect_regex(x, rx_whole_word)
#' @name WordBoundaries
NULL

#' @rdname WordBoundaries
#' @export
BOUNDARY <- as.regex("\\b")

#' @rdname WordBoundaries
#' @export
NOT_BOUNDARY <- as.regex("\\B")
