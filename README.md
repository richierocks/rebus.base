[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Is the package on CRAN?](http://www.r-pkg.org/badges/version/rebus.base)](http://www.r-pkg.org/pkg/rebus.base)
[![SemaphoreCI Build Status](https://semaphoreci.com/api/v1/projects/535d7d77-f416-4ed9-aa69-bba5a38df545/635152/badge.svg)](https://semaphoreci.com/richierocks/rebus-base)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/ah32txok331kk79t?svg=true)](https://ci.appveyor.com/project/richierocks/rebus-base)

# rebus.base: Regular Expression Builder, Um, Something (Base Functionality)

This package contains the core functionality for the [*rebus*](https://github.com/richierocks/rebus) package.  It is primarily intended for other R package developers.  For interactive use, try *rebus* instead.

## Build regular expressions in a human readable way

Regular expressions are a very powerful tool, but the syntax is terse enough
to be difficult to read.  This makes bugs easy to introduce and hard to
find.  This package contains functions to make building regular expressions
easier.

## Installation

To install the stable version, type:

```{r}
install.packages("rebus.base")
```

To install the development version, you first need the *devtools* package.

```{r}
install.packages("devtools")
```

Then you can install the *rebus.base* package using

```{r}
library(devtools)
install_github("richierocks/rebus.base")
```

## Package contents

### Character classes

Character classes to both constant and functional forms, the latter allowing matching of repeated values.  For example, `ALPHA` represents an alphabetic character (equivalent to `[:alpha:]`), whereas `alpha(3, 6)` matches between 3 and 6 alphabetic characters (equivalent to `[[:alpha:]]{3,6}`).

All the POSIX classes described on the `?regex` page are supported, along with generic shorthand classes, and some character ranges. For example `DIGIT` is the R-specifc form of a number (equivalent to `[:digit:]`), `DGT` represents the shorthand class (equivalent to `\\d`), and `ASCII_DIGIT` uses a number range (equivalent to `[0-9]`).  See [*rebus.unicode*](https://github.com/richierocks/rebus.unicode) for Unicode General Categories and Unicode Properties which are preferred over POSIX classes for *stringi* and *stringr*.

Custom character classes can be created using `char_class`.  For example, to match lower case letters and punctuation, you can use `char_class(LOWER %R% PUNCT)` (equivalent to `[[:lower:][:punct:]]`).  Here, `%R%` is a regular expression concatenation operator.

### Special characters

Pre-escaped constants are available for special characters.  For example `DOT` is `\\.`, `BACKSLASH` is `\\\\`.

Note the difference between the special character `CARET` (`\\^`) and the anchor `START` (`^`).

`escape_special` is a functional form for creating those constants.

### Repetition

You can manually apply repetition using `repeated`.  For example, `repeated(ALPHA, 2, 8)` or `repeated(alpha(), 2, 8)` (both equivalent to `[[:alpha:]]{2,8}`).  This makes most sense for custom character classes.

### Grouping and capturing

`group` creates a group within the regular expression.  `capture` does the same, but captures it for *matching*.  For example, `group("groupies")` (equivalent to `(?:groupies)`) and `capture("groupies")` (equivalent to `(groupies)`).

`engroup` takes a `capture` argument and calls `capture` when it is `TRUE` and `group` when it is `FALSE`.

### Alternation

You can match one string or another using `or`.  For example, `or("dog", "cat", "hippopotamus")` (equivalent to `(?:dog|cat|hippopotamus)`).

`or1` does the same as `or`, but takes a single character vector as an input.  For example, `or1(c("dog", "cat", "hippopotamus"))` is the same as the previous example.

The `%|%` operator does the same for the special case of two inputs, without grouping. For example, `"dog" %|% "cat"` (equivalent to `dog|cat`).

### Lookaround

Zero-length assertions match characters then give up the match.  `lookahead` and `negative_lookahead` match forwards, and `lookbehind` and `negative_lookbehind` match backwards.  Note that the last two aren't supported by R's PCRE engine, only it's Perl engine and *stringi*/*stringr*'s ICU engine.  For example, `q %R% lookahead("u")` matches "q" followed by "u", but only includes "q" in the match.

### Backreferences

`REF1` to `REF9` contain references to captured groups of the form `\\i`, for reuse with replacement functions and R's PRCE and PErl engines.  `ICU_REF1` to `ICU_REF9` contain references of the form `$i`, for use with the ICU engine.

### Mode modifiers

`case_insensitive` makes the match not care about case.

`free_spacing` allows whitespace between tokens.

`single_line` makes the dot match line breaks and makes the caret and dollar match the start and end of the whole string.  `multi_line` makes the dot not match line breaks, and makes the caret and dollar match character after/before line breaks as well as the start and end of the whole string.

`duplicate_group_names` allows groups to have the same names.

`no_backslash_escaping` turns off backslash escaping.

`modify_mode` allows multiple mode-modifiers to be set at once.

### Miscellaneous

`exactly` forces a match to occur exactly, by wrapping it in start and end anchors.

`literal` treats its contents are literal characters rather than special regular expression characters.

