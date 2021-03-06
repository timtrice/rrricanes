#' @title filter_discus
#' @description Filter out storm discussion links.
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_discus <- function(links) {
  grep("/dis/N(AL|EP)|discus", x = links, value = TRUE)
}

#' @title filter_fstadv
#' @description Filter out forecast/advisory links
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_fstadv <- function(links) {
  grep("/mar/M(AL|EP)|fstadv", x = links, value = TRUE)
}

#' @title filter_orig
#' @description For Katrina, 2005, there are two identical discussions; one of
#'   which has 'orig' in the URL. Because this link is not captured above it
#'   will throw an error. This function is an effort to capture it and pass
#'   it through the validation but, at least for this Katrina it is not
#'   necessary. That being said, if there is output for any other storms it
#'   should be reviewed as it is common for the NHC to issue UPDATED statements.
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_orig <- function(links) {
  grep("orig", x = links, value = TRUE)
}

#' @title filter_posest
#' @description Get position estimates
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_posest <- function(links) {
  grep("posest", x = links, value = TRUE)
}

#' @title filter_public
#' @description Get public advisories
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_public <- function(links) {
  grep("/pub/P(AL|EP)|/pub/PA(AL|EP)|/pub/PB(AL|EP)|public",
       x = links,
       value = TRUE)
}

#' @title filter_prblty
#' @description Get strike probabilities.
#' @details Strike probability products were terminated at the end of the 2005
#' season, replaced by wind probabilities.
#' @seealso \code{\link{filter_wndprb}}
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_prblty <- function(links) {
  grep("/prb/L(AL|EP)|prblty", x = links, value = TRUE)
}

#' @title filter_update
#' @description Get updates
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_update <- function(links) {
  grep("update", x = links, value = TRUE)
}

#' @title filter_wndprb
#' @description Get wind probabilities
#' @details Wind probability products replaced the strike probability products
#' at the beginning of the 2006 season.
#' @seealso \code{\link{filter_prblty}}
#' @param links Vector of URLs retrieved from storm's archive page.
#' @keywords internal
filter_wndprb <- function(links) {
  grep("wndprb", x = links, value = TRUE)
}
