
[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.5.0-6666ff.svg)](https://cran.r-project.org/)
[![GitHub
(pre-)release](https://img.shields.io/github/release/ropensci/rrricanes/all.svg)](https://github.com/ropensci/rrricanes/tags)
[![](https://badges.ropensci.org/118_status.svg)](https://github.com/ropensci/onboarding/issues/118)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rrricanes)](https://cran.r-project.org/package=rrricanes)
[![Build
Status](https://img.shields.io/travis/ropensci/rrricanes/master.svg)](https://travis-ci.org/ropensci/rrricanes)
[![AppVeyor Build
Status](https://img.shields.io/appveyor/ci/timtrice/rrricanes-g4dos/master.svg)](https://ci.appveyor.com/project/timtrice/rrricanes-g4dos)
[![codecov](https://codecov.io/gh/ropensci/rrricanes/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/rrricanes)

# rrricanes <img src='man/figures/logo.png' align="right" height="138" />

`rrricanes` is a R library that extracts information from [available
archives](http://www.nhc.noaa.gov/archive/1998/1998archive.shtml) on
past and current tropical cyclones. Currently, archives date back to
1998.

Data can be obtained for cyclones in the north Atlantic (considered the
Atlantic Basin) and north-eastern Pacific (the East Pacific Basin from
140°W and eastward.

Central Pacific data (140°W to 180°W) is included if issued by the
[National Hurricane Center](http://www.nhc.noaa.gov/) (generally they’re
issued by the [Central Pacific Hurricane
Center](http://www.prh.noaa.gov/cphc/)).

This library parses the text advisories of all tropical cyclones since
1998. Over the years the formats of the text products have changed and
many are loosely formatted.

I wrote this package with the goal of consolidating messy text data into
well-organized formats that can easily be saved to CSV, SQL and other
data formats.

You may explore some features of the package through the
[shinycanes](https://timtrice.shinyapps.io/shinycanes/) beta web
application (built with R Shiny).

## Advisory Products

Generally speaking, there are five products available for tropical
cyclones issued at 03:00, 09:00, 15:00 and 21:00 UTC;

1.  Storm Discussion - These are technical discussions centered on the
    current structure of the cyclone, satellite presentation, computer
    forecast model tendencies and more.

2.  Forecast/Adivsory - This data-rich product lists the current
    location of the cyclone, its wind structure, forecast and forecast
    wind structure.

3.  Public Advisory - These are general text statements issued for the
    public-at-large. Information in these products is a summary of the
    Forecast/Advisory product along with any watches and warnings
    issued, changed, or cancelled. Public Advisory products are the only
    regularly-scheduled product that may be issued intermittently (every
    three hours and, occasionally, every two hours) when watches and
    warnings are in effect.

4.  Wind Speed Probabilities - These products list the probability of a
    minimum sustained wind speed expected in a given forecast window.
    This product replaces the Strike Probabilities product beginning in
    2006 (see below).

5.  Updates - Tropical Cyclone Updates may be issued at any time if a
    storm is an immediate threat to land or if the cyclone undergoes a
    significant change of strength or structure. The information in this
    product is general.

**Discontinued Products**

These products are included in the package though they have been
discontinued at some point:

1.  Strike Probabilities - List the probability of a tropical cyclone
    passing within 65 nautical miles of a location within a forecast
    window. Replaced in 2006 by the Wind Speed Probabilities product.

2.  Position Estimates - Typically issued as a storm is threatening land
    but generally rare (see Hurricane Ike 2008, Key AL092008). It is
    generally just an update of the current location of the cyclone.
    After the 2011 hurricane season, this product was discontinued;
    Updates are now issued in their place.

## Getting Started

Please view the vignette ‘Getting Started’:

``` r
vignette("getting_started", package = "rrricanes")
```

[Online documentation](https://timtrice.github.io/rrricanes/) is also
available.

### Prerequisites

`rrricanes` requires an active internet connection as data is extracted
from online sources.

Linux users must also have the `libgdal-dev`, `libproj-dev` and
`libxml2-dev` packages installed.

To add `rrricanesdata`, a [package of post-scraped
datasets](https://github.com/ropensci/rrricanesdata),

``` r
install.packages("rrricanesdata", 
                 repos = "https://timtrice.github.io/drat/", 
                 type = "source")
```

To use high resolution tracking maps you will need to install the
`rnaturalearthhires` package.

``` r
install.packages("rnaturalearthhires",
                 repos = "http://packages.ropensci.org",
                 type = "source")
```

### Installing

`rrricanes` is currently only available in GitHub. It can be installed
using the `devtools` package:

``` r
devtools::install_github("ropensci/rrricanes", build_vignettes = TRUE)
```

## Built With

  - [R 3.3.3](https://www.r-project.org/) - The R Project for
    Statistical Computing

## Contributing

Please read
[CONTRIBUTING.md](https://github.com/ropensci/rrricanes/blob/master/.github/CONTRIBUTING.md)
for details on our code of conduct, and the process for submitting pull
requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this
repository](https://github.com/ropensci/rrricanes/tags).

## Authors

  - **Tim Trice** - *Initial work* -
    [timtrice](https://github.com/timtrice)

See also the list of
[contributors](https://github.com/ropensci/rrricanes/contributors) who
participated in this project.

## License

This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details

## Acknowledgments

  - [Molyneux, James](https://github.com/jimmylovestea)
  - [Padgham, Mark](https://github.com/mpadge)
  - [Robinson, Emily](https://github.com/robinsones)
  - [Rudis, Bob](https://github.com/hrbrmstr)
  - [Salmon, Maëlle](https://github.com/maelle)
  - [Stachelek, Joseph](https://github.com/jsta)

## Known Data Quality Issues

1.  Hurricane Juan (AL152003), Adv 15; no status leads to improper
    `Status` and `Name` values in some datasets.
    ([\#82](https://github.com/ropensci/rrricanes/issues/82))
