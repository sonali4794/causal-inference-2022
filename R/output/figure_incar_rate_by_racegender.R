# Builds a bar graph with mean incarceration rate on the y axis and race/gender on the
# x axis.
# We compute incarceration rate as number of people incarcerated for a given 100,000 individuals
read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(incar_rate = mean(whether_incar)*100000) %>%
  ggplot(aes(race, incar_rate, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Average Incarceration Rate", 
      fill = "Gender",
      title = "Average Incarceration Rate in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/incar_rate_by_racegender.png"), width=8, height=4.5)
