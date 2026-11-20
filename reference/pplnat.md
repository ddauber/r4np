# People and Nature Survey for England, 2020-2023

The People and Nature Survey for England is a study conducted to gather
data on how people use, enjoy, and benefit from the natural environment
in England.

## Usage

``` r
pplnat
```

## Format

A data frame with 3585 rows and 19 variables:

- region:

  Different regions in England where data was collected.

- wave:

  Data was collected in several waves. This provides opportunities to
  analyse data over time.

- time_in_green:

  Item: *In the last 12 months, how often, on average have you spent
  free time outside in green and natural spaces?*

- ncs_easy_walking_distance:

  Item: *How much do you agree or disagree with the following statements
  relating to green and natural spaces locally: Within easy walking
  distance.* \| 1 ("Strongly disagree") to 5 = ("Strongly agree").

- ncs_relax_unwind:

  Item: *How much do you agree or disagree with the following statements
  relating to green and natural spaces locally: Places where I can relax
  and unwind.* \| 1 ("Strongly disagree") to 5 = ("Strongly agree").

- ncs_high_enough_standard:

  Item: *How much do you agree or disagree with the following statements
  relating to green and natural spaces locally: A high enough standard
  to want to spend time in.* \| 1 ("Strongly disagree") to 5 =
  ("Strongly agree").

- imp_protect_environment:

  Item: *How important is protecting the environment to you personally?*
  \| 1 ("Not at all important") to 5 = ("Very important").

- concerned_damaging_environment:

  Item: *How much do you agree or disagree with the following statement?
  I am concerned about damage to the natural environment.* \| 1 ("Not at
  all important") to 5 = ("Very important").

- pick_up_litter:

  Item: *How often do you do the actions below when you have the
  opportunity? When I see litter, I pick it up.* \| 1 ("Never") to 5 =
  ("Always / whenever I have the opportunity").

- vote_political_party:

  Item: *How often do you do the actions below when you have the
  opportunity? I vote for political parties with strong environmental
  policies* \| 1 ("Never") to 5 = ("Always / whenever I have the
  opportunity").

- change_lifestyle:

  Item: *Are you going to make changes to your lifestyle to protect the
  environment (for example by recycling rather than throwing things
  away, using your car less and buying local food)?*

- wb_lonely:

  Item: *How often do you feel lonely?* \| 1 ("Never") to 5 = ("Often /
  always").

- wb_satisfied:

  Item: *Overall, how satisfied are you with your life nowadays?* \| 1
  ("Not at all") to 10 = ("Completely").

- wb_worthwhile:

  Item: *Overall, how worthwhile are the things you do in your life?* \|
  1 ("Not at all") to 10 = ("Completely").

- wb_happy:

  Item: *How happy were you feeling yesterday?* \| 1 ("Not at all") to
  10 = ("Completely").

- wb_worried_anxious:

  Item: *How anxious were you feeling yesterday?* \| 1 ("Not at all") to
  10 = ("Completely").

- wb_worried_anxious_r:

  This is the reverse-scored item for `wb_worried_anxious`.

- ncs:

  Natural connectedness scale (latent variable based on `ncs` items). A
  higher score implies higher natural connectedness.

- wellbeing:

  Wellbeing (latent variable based on `wb` items). A higher score
  implies higher wellbeing

## Source

Natural England. (2023). People and Nature Survey for England,
2020-2023: Open Access. 3rd Edition. UK Data Service. SN: 9092.
[doi:10.5255/UKDA-SN-9092-3](https://doi.org/10.5255/UKDA-SN-9092-3)
