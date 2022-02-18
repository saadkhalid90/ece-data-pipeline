## script for installing installing ruODK

# Enable the rOpenSci universe
options(
  repos = c(ropensci = 'https://ropensci.r-universe.dev',
  CRAN = 'https://cloud.r-project.org')
)

install.packages('ruODK')

vignette("odata-api", package="ruODK")
