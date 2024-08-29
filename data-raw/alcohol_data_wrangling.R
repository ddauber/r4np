
# ALCOHOL CONSUMPTION TOTAL -----------------------------------------------

alcohol_total_raw <- read_csv("/Users/danieldauber/Downloads/total-alcohol-consumption-per-capita-litres-of-pure-alcohol.csv")

alcohol_total_raw <- alcohol_total_raw |> janitor::clean_names()

## rename variables
alcohol_total_raw <-
  alcohol_total_raw |>
  rename(country = entity,
         consumption = total_alcohol_consumption_per_capita_liters_of_pure_alcohol_projected_estimates_15_years_of_age)

glimpse(alcohol_total_raw)

# REVIEW DATASET ----------------------------------------------------------

## Check for missing data
alcohol_total_raw |> naniar::vis_miss()

## There seem to be some country codes missing
alcohol_total_raw |>
  select(country, code) |>
  filter(is.na(code)) |> print(n = Inf)

## It is regions that should not be included - REMOVAL

alcohol_total_nona <- alcohol_total_raw |> na.omit()

alcohol_total_nona |> naniar::vis_miss()

## Change data types

alcohol <-
  alcohol_total_nona |>
  mutate(country = as_factor(country),
         code    = as.factor(code))

## Only include lates year

alcohol |> count(year)

alcohol_2019 <-
  alcohol |>
  filter(year == "2019")

## Check whether there is only one entry per country - IT IS :)
alcohol_2019 |> count(country) |> print(n = Inf)
