# COVID Data
# Date of download: 27 August 2021
# Source: https://covid19.who.int/info/

# PACKAGES ----
library(tidyverse)

# LOAD DATASETS ----
covid_raw <- read_csv("data-raw/covid_raw.csv")
vaccination_data_raw <- read_csv("data-raw/vaccination-data_raw.csv")
phsm_severity_data_raw <- read_csv("data-raw/phsm-severity-data_raw.csv")

# COVID CASES ----
## change all <chr> to <fct>
covid <- covid_raw %>%
  mutate_if(is.character, as.factor)

## clean up column names
covid <- covid %>% janitor::clean_names()

# VACCINATION DATA ----

## Clean up column names
vaccination_data <- vaccination_data_raw %>%
  janitor::clean_names()

## shorten some column names
vaccination_data <- vaccination_data %>%
  rename("vaccinated_1plus_dose" = "persons_vaccinated_1plus_dose",
         "vaccinated_1plus_dose_per100" = "persons_vaccinated_1plus_dose_per100",
         "fully_vaccinated" = "persons_fully_vaccinated",
         "fully_vaccinated_per100" = "persons_fully_vaccinated_per100")

# JOIN covid + vaccination_data ----
covid <- left_join(covid, vaccination_data, by = c("country", "who_region"))

# COVID MEASURES ----

## clean column names
phsm <- phsm_severity_data_raw %>% janitor::clean_names()

## remove country col because of potential naming conflicts
phsm <- phsm %>%
  select(!country)

## rename col to allow left_join by date too
phsm <- phsm %>%
  rename("date_reported" = "date_start")

## join with rest of dataset
covid2 <- left_join(covid, phsm, by = c("iso3", "who_region", "date_reported"))

# FINAL CLEAN UPS ----
## Inspect long country names
covid %>%
  count(country) %>%
  filter(stringr::str_length(country) > 15) %>%
  select(country) %>%
  print(n = Inf)

## shorten long country names
covid <- covid %>%
  mutate(country = fct_recode(country,
                              "Bolivia" = "Bolivia (Plurinational State of)",
                              "DPR Korea" = "Democratic People's Republic of Korea",
                              "Congo" = "Democratic Republic of the Congo",
                              "Falkland Islands" = "Falkland Islands (Malvinas)",
                              "Iran" = "Iran (Islamic Republic of)",
                              "Laos" = "Lao People's Democratic Republic",
                              "Micronesia" = "Micronesia (Federated States of)",
                              "Palestinian territory (incl. Jerusalem)" = "occupied Palestinian territory, including east Jerusalem",
                              "Venezuela" = "Venezuela (Bolivarian Republic of)",
                              "United Kingdom" = "The United Kingdom")
  )

## convert <chr> to <fct> and make it a tibble
covid <- covid %>%
  mutate(who_region = as_factor(who_region),
         iso3 = as_factor(iso3),
         data_source = as_factor(data_source)
         ) %>%
  as_tibble()

# Add cleaned data to package
usethis::use_data(covid, overwrite = TRUE)
