% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mode-modifiers.R
\name{modify_mode}
\alias{modify_mode}
\alias{case_insensitive}
\alias{free_spacing}
\alias{single_line}
\alias{multi_line}
\alias{duplicate_group_names}
\alias{no_backslash_escaping}
\title{Apply mode modifiers}
\usage{
modify_mode(x, modes = c("i", "x", "s", "m", "J", "X"))

case_insensitive(x)

free_spacing(x)

single_line(x)

multi_line(x)

duplicate_group_names(x)

no_backslash_escaping(x)
}
\arguments{
\item{x}{A character vector.}

\item{modes}{A character vector of mode modifiers.}
}
\value{
A character vector representing part or all of a regular expression.
}
\description{
Applies one or more mode modifiers to the regular expression.
}
\examples{
x <- "foo"
case_insensitive(x)
free_spacing(x)
single_line(x)
multi_line(x)
duplicate_group_names(x)
no_backslash_escaping(x)
modify_mode(x, c("i", "J", "X"))
}
\references{
\url{http://www.regular-expressions.info/modifiers.html} and
\url{http://www.rexegg.com/regex-modifiers.html}
}
