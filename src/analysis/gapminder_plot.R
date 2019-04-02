# Make a plot of life expectancy in Africa

library(here)
library(tidyverse)

# Read in the data
gapminder <- readr::read_csv(here("data/gapminder/raw/gapminder_data.csv"))

# The R base way
mean(gapminder$gdpPercap[gapminder$continent == "Africa"])
mean(gapminder$gdpPercap[gapminder$continent == "Americas"])

# Using dplyr
year_country_gdp <- select(gapminder, year, country, gdpPercap)

gapminder %>%
  group_by(continent) %>%
  summarize(mean_val = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap))

gapminder %>%
  filter(continent == "Africa") %>%
  ggplot( aes(x = year, y = lifeExp, color = continent)) +
    geom_line() +
    facet_wrap( ~ country)




