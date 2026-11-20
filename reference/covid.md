# COVID-19 DATA

A dataset which contains COVID cases and deaths, vaccination information
and public health social measures (PHSM) for each country covered by the
WHO.

## Usage

``` r
covid
```

## Format

A data frame with 142674 rows and 17 variables:

- date_reported:

  Date when cases, deaths, PHSM, etc. were reported

- iso3:

  ISO three-digit country identifier

- country:

  Name of country

- new_cases:

  \# of new COVID cases

- cumulative_cases:

  Total number of COVID cases

- cumulative_deaths:

  Total number of deaths due to COVID

- fully_vaccinated:

  Total number of fully vaccinated people

- masks:

  Index of mask measures implemented (0-100)

- travel:

  Index of travel measures implemented (0-100)

- gatherings:

  Index of gathering measures implemented (0-100)

- schools:

  Index of school measures implemented (0-100)

- businesses:

  Index of business measures implemented (0-100)

- movements:

  Index of movement measures implemented (0-100)

- global_index:

  Global index of overall measures implemented (0-100)

- measures_in_place:

  Lists all measures in place according to WHO taxanomy

- region:

  Region a country is located in (WHO classification)

- population:

  Population of a country as of 2016

## Source

World Health Organisation (WHO). Dataset retrieved on 2nd February 2023
from: <https://covid19.who.int/info/>. WHO data is licensed under
Creative Commons Attribution 4.0 International License (CC BY 4.0).
