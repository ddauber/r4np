# World Value Survey (Waves)

A dataset excerpt from the World Value Survey including 3 countries over
7 waves of data collection.

## Usage

``` r
wvs_waves
```

## Format

A data frame with 2100 rows and 5 variables:

- id:

  Unique ID for each participant

- wave:

  Random names created with `randomName` package

- country:

  Defines whether a test was performed before or after training

- satisfaction:

  Item: *All things considered, how satisfied are you with your life as
  a whole these days? \| 1 (“completely dissatisfied”) to 10
  (“completely satisfied”)*

- freedom_of_choice:

  Item: *Some people feel they have completely free choice and control
  over their lives, while other people feel that what they do has no
  real effect on what happens to them. Indicate how much freedom of
  choice and control you feel you have over the way your life turns out
  \| 1 ("no choice at all") to 10 ("a great deal of choice").*

## Source

World Value Survey (WVS). Data retrieve from
<https://www.worldvaluessurvey.org>
