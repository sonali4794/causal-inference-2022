# Builds a LaTeX table of avearge incarceration rate by race and gender.
# See the pivoting vignette for how to use pivot functions.
# vignette("pivot")
# Documentation for the kableExtra package is here:
# https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_pdf.pdf

read_csv(here("data/NLSY97_clean.csv")) %>%
  
  # summarize incarceration rate by race and gender
  group_by(race, gender) %>%
  summarize(incar_rate = mean(whether_incar)*100000) %>%
  
  # pivot the values from race into columns
  pivot_wider(names_from = race, values_from = incar_rate) %>%
  
  # rename columns using snakecase
  rename_with(to_title_case) %>%
  
  # create the kable object. Requires booktabs and float LaTeX packages
  kbl(
    caption = "Incarceration Rate (as a proportion of 100,000 individuals) in 2002 by Race and Gender",
    booktabs = TRUE,
    format = "latex",
    label = "tab:summarystats"
  ) %>%
  kable_styling(latex_options = c("striped", "HOLD_position")) %>%
  
  write_lines(here("tables/incar_rate_by_racegender.tex"))
  