# CRAN Packages
packages_cran <- c(
    "arrow",
    "av",
    "beanplot",
    "bibtex",
    "brms",
    "broom",
    "bs4cards",
    "Cairo",
    "carData",
    "cbcTools",
    "chromote",
    "colorspace",
    "colourpicker",
    "countdown",
    "cowplot",
    "DAAG",
    "datapasta",
    "data.table",
    "devtools",
    "distill",
    "dslabs",
    "extrafont",
    "extrafontdb",
    "fcuk",
    "flextable",
    "fontawesome",
    "foreach",
    "gapminder",
    "geomtextpath",
    "GGally",
    "gganimate",
    "ggrepel",
    "ggtext",
    "ggthemes",
    "googlesheets4",
    "gridExtra",
    "gsheet",
    "gtsummary",
    "here",
    "HistData",
    "Hmisc",
    "httpgd",
    "janitor",
    "kableExtra",
    "knitr",
    "languageserver",
    "lattice",
    "latticeExtra",
    "logitr",
    "lubridate",
    "mapdata",
    "markdown",
    "MASS",
    "mapsapi",
    "mlogit",
    "rnaturalearth",
    "nloptr",
    "nycflights13",
    "officer",
    "pak",
    "pdftools",
    "postcards",
    "priceR",
    "quarto",
    "randtoolbox",
    "RColorBrewer",
    "readxl",
    "remotes",
    "renderthis",
    "reticulate",
    "rgeos",
    "rjson",
    "rmarkdown",
    "roxygen2",
    "rstan",
    "rstanarm",
    "rstantools",
    "rvest",
    "sass",
    "scales",
    "shiny",
    "shinycssloaders",
    "shinyjs",
    "shinythemes",
    "StanHeaders",
    "staplr",
    "surveydown",
    "tidyverse",
    "testthat",
    "treemap",
    "tufte",
    "TurtleGraphics",
    "urlchecker",
    "webshot2",
    "wikifacts",
    "wordcloud",
    "xml2",
    "xaringan",
    "xtable",
    "waffle",
    "yaml",
    "zipcode",
    "zoo"
)

# Dev packages
packages_dev <- c(
    'brooke-watson/BRRR',
    'EllaKaye/distilltools',
    'hadley/emo',
    'hansthompson/rusps',
    'hrbrmstr/hrbrthemes',
    'jhelvy/jph',
    'gadenbuie/metathis', 
    'gadenbuie/rsthemes',
    'gadenbuie/xaringanExtra', 
    'r-lib/revdepcheck',
    'r-lib/ymlthis',
    'ropensci/rnaturalearthhires',
    'ropensci/rnaturalearthdata',
    'wilkelab/gridtext'
)

# Install packages from CRAN
install.packages(
    packages_cran,
    repos = 'https://cloud.r-project.org/',
    dependencies = TRUE)

# Install dev packages from github
pak::pak(packages_dev, force = TRUE)

# Install qs package
remotes::install_cran(
    "qs", type = "source", configure.args = "--with-simd=AVX2"
)

# Install RStudio themes
rsthemes::install_rsthemes(include_base16 = TRUE)

# Finally, install the macrtools tool chain:
# https://mac.thecoatlessprofessor.com/macrtools/

# install.packages("remotes")
remotes::install_github("coatless-mac/macrtools")

# Check if toolchain pieces are installed
macrtools::is_xcode_cli_installed()
macrtools::is_gfortran_installed()

# If not, install:
macrtools::macos_rtools_install()
