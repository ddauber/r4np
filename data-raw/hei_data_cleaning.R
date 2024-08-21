# Health Index England ----------------------------------------------------

# LOAD PACKAGES -----------------------------------------------------------
library(tidyverse)

#  LOAD DATASET -----------------------------------------------------------

hie_raw <- read_csv("data-raw/health_index_england_raw_data.csv")

# CLEAN UP DATASET --------------------------------------------------------

## clean column names and removal of unnecessary variables
hie_clean_names <-
  janitor::clean_names(hie_raw) |>
  select(-numerator,
         -denominator,
         -area_code)

## Ad ID column
hie_clean_names_id <-
  hie_clean_names |>
  mutate(id = seq(1:nrow(hie_clean_names))) |>
  select(id, everything())

## Check completness of data
hie_clean_names_id |> naniar::vis_miss(warn_large_data = FALSE)

## pivot-wider to turn indicators into column names
hie_pivoted <-
  hie_clean_names_id |>
  pivot_wider(id_cols = c(area_name, year),
              names_from = indicator_name,
              values_from = c(value)) |>
  janitor:: clean_names()

glimpse(hie_pivoted)
naniar::vis_miss(hie_pivoted)

hie_pivoted |> colnames()

hie_pivoted |>
  # select(life_satisfaction, happiness, life_expectancy) |>
  filter(year == "2021") |>
  correlation::correlation() |>
  filter(r >= 0.3 | r <= -0.3)


# SELECT VARIABLES --------------------------------------------------------
hie_select <-
  hie_pivoted |>
  select(
    area_name,
    year,
    activities_in_life_are_worthwhile,
    early_years_development,
    feelings_of_anxiety,
    happiness, healthy_eating,
    high_blood_pressure,
    household_overcrowding,
    life_expectancy,
    life_satisfaction,
    low_level_crime,
    mental_health_conditions,
    overweight_and_obesity_in_adults,
    overweight_and_obesity_in_children,
    physical_activity,
    rough_sleeping,
    smoking,
    unemployment,
    young_people_in_education_employment_and_apprenticeships
  )

# ADDING A REGIONAL CATEGORISATION ----------------------------------------

## Create list of areas
hie_select |> count(area_name) |> print(n = Inf)

## I used ChatGPT to categorise data based on area_name

## Import region classification data
region <- read_csv("data-raw/hei_region.csv")

## Append region to
hie_select_region <-
  left_join(hie_select, region, by = "area_name")

hie_select_region <-
  hie_select_region |>
  select(area_name, region, year, everything())

# CHANGE DATA TYPES -------------------------------------------------------
hie_select_region <-
  hie_select_region |>
  mutate(area_name = as_factor(area_name),
         region    = as_factor(region)
         )



# RENAME LONG VARIABLE ----------------------------------------------------

hie_select_region <-
  hie_select_region |>
  rename(young_ppl_edu_empl_appren = young_people_in_education_employment_and_apprenticeships)

# FINAL DATASET -----------------------------------------------------------

hie <- hie_select_region
