# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(length_of_incareration = mean(incar_duration)) %>%
  ggplot(aes(race, length_of_incareration, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    ylim(0,600) +
    labs(
      x = "Race", 
      y = "Incarceration Period", 
      fill = "Gender",
      title = "Total Number of Months that the individual was incarcerated for in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/incar_length_by_racegender.png"), width=8, height=4.5)
