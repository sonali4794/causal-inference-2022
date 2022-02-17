# installs the librarian package if you don't have it
if (!("librarian" %in% rownames(utils::installed.packages()))) {
  utils::install.packages("librarian")
}

# put all of the packages that you import here
librarian::shelf( 
  cran_repo = "https://cran.microsoft.com/", # Dallas, TX
  ask = FALSE,
  stats, # https://stackoverflow.com/questions/26935095/r-dplyr-filter-not-masking-base-filter#answer-26935536
  here,
  kableExtra,
  rlang,
  ggthemes,
  tidyverse,
  janitor,
  magrittr,
  glue,
  lubridate,
  haven,
  snakecase,
  sandwich,
  lmtest,
  gganimate,
  gapminder,
  stargazer,
  snakecase,
)

# tell here where we are so we can use it elsewhere
here::i_am("R/include.R")

#installing latex packages
install.packages('tinytex')
tinytex::install_tinytex()

#installing missing latex packages
library(tinytex)
tlmgr_search('/colortbl.sty')
tlmgr_install('colortbl')

tlmgr_search('/a4wide.sty')
tlmgr_install('a4wide')

tlmgr_search('/a4.sty')
tlmgr_install('ntgclass')

tlmgr_search('/setspace.sty')
tlmgr_install('setspace')

tlmgr_search('/parskip.sty')
tlmgr_install('parskip')

tlmgr_update()