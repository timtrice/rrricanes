#' @title Hurricanes
#' @description Hurricanes is a web-scraping library for R designed to deliver
#' hurricane data (past and current) into well-organized datasets. With these
#' datasets you can explore past hurricane tracks, forecasts and structure
#' elements.
#'
#' Text products (Forecast/Advisory, Public Advisory, Discussions and
#' Probabilities) are only available from 1998 to current. An effort will be
#' made to add prior data as available.
#'
#' @section Getting Storms:
#' List all storms that have developed by year and basin. Year must be in a
#' four-digit format (\%Y) and no earlier than 1998. Basin can be one or both
#' of Atlantic ("AL") or East Pacific ("EP").
#' \describe{
#'   \item{\code{\link{get_storms}}}{List all storms by year, basin}
#' }
#'
#' @section Getting Storm Data:
#' To be written...
#'
#' @docType package
#' @name Hurricanes
NULL

#' @title convert_lat_lon
#' @description Converts lat, lon to negative if in southern, western
#'   hemisphere, respectively
#' @param x integer
#' @param y character
#' @return integer positive or negative
#' @export
convert_lat_lon <- function(x, y) {

    if (!is.numeric(x)) {stop("x is not numeric!")}
    if (!(y %in% c('N', 'S', 'E', 'W'))) { stop("y must be c('N','S','E','W')") }

    ifelse(y == 'S' | y == 'W', return(x * -1), return(x))

}

#' @title .extract_year_archive_link
#' @description Extracts the year from the archive link.
#' @param link URL of archive page
#' @return year 4-digit numeric
.extract_year_archive_link <- function(link) {

  # Year is listed in link towards the end surrounded by slashes.
  year <- as.numeric(stringr::str_match(link, '/([:digit:]{4})/')[,2])

  return(year)

}

#' @title get_nhc_link
#' @description Return root link of NHC archive pages.
#' @param withTrailingSlash True, by default. False returns URL without
#' trailing slash.
#' @export
get_nhc_link <- function(withTrailingSlash = TRUE) {
  if (withTrailingSlash)
    return('http://www.nhc.noaa.gov/')
  return('http://www.nhc.noaa.gov')
}

#' @title knots_to_mph
#' @description convert knots (kt) to miles per hour (mph)
#' @param x wind speed in knots
#' @return x in mph
#' @export
knots_to_mph <- function(x) {
    return(x * 1.15077945)
}

#' @title mb_to_in
#' @description convert millibars (mb) to inches of mercury (in)
#' @param x barometric pressure in mb
#' @return x in in
#' @export
mb_to_in <- function(x) {
    return(x * 0.029529983071)
}

#' @title month_str_to_num
#' @description Convert three-character month abbreviation to integer
#' @param m Month abbreviated (SEP, OCT, etc.)
#' @return numeric 1-12
month_str_to_num <- function(m) {

  if (is.character(m) & length(m) != 3) {
    m <- which(month.abb == toproper(m))
    return(m)
  } else {
    stop('Expected three-character string.')
  }

}

#' @title .status
#' @description Test URL status.
#' @details Return URL if status is 'OK'. Otherwise, return NA and print
#' failed URL.
#' @param u URL to test
#' @return URL if result is 'OK', otherwise, NA.
.status <- function(u) {
  stat = httr::http_status(httr::GET(u))
  if (stat$reason == 'OK') {
    return(u)
  } else {
    warning(sprintf("URL unavailable. %s", u))
    return(NA)
  }
}

#' @title toproper
#' @description Convert a string to proper case.
#' @details Taken from \code{\link{chartr}} examples in base R. Will take a
#'   phrase or, in the case of this project, full name and status of a cyclone,
#'   e.g., "TROPICAL STORM ALEX" and return "Tropical Storm Alex".
#' @param s Word or phrase to translate.
#' @param strict TRUE by default. Will convert all upper case characters to
#'   lower case. If FALSE, no conversion will be done.
#' @examples
#' toproper("TROPICAL STORM ALEX")
#' toproper("TROPICAL STORM ALEX", strict = FALSE)
#' @export
toproper <- function(s, strict = TRUE) {
  cap <- function(s) paste(toupper(substring(s, 1, 1)),
                           {s <- substring(s, 2); if (strict) tolower(s) else s},
                           sep = "", collapse = " " )
  sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

#' @title .validate_year
#' @description Test if year is 4-digit numeric.
#' @return numeric year(s)
#' @examples
#' validate_year(1990)
#' validate_year(1991:1995)
#' validate_year(c(1996, 1997, 1998))
#' validate_year(c('1999', '2000'))
#' validate_year(list(2001, '2002', '2003'))
#' \dontrun{
#' validate_year(199) # Generates error}
.validate_year <- function(y) {
  y <- as.numeric(y)
  if (all(is.na(y)))
    stop('Year must be numeric.')
  if (any(nchar(y) != 4))
    stop('Year must be 4 digits.')
  return(y)
}