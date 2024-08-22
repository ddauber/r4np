# European Quality of Life Survey (EQLS)
# Date: 2024-02-27


# LOAD PACKAGES -----------------------------------------------------------
library(tidyverse)
library(purrr)

# IMPORT DATA -------------------------------------------------------------
eqls_raw <- read_csv("data-raw/eqls_2007and2011.csv")
iso_country_codes <- read_csv("data-raw/iso_country_codes.csv")

glimpse(eqls_raw)

# FIX COUNTRY NAMES -------------------------------------------------------

result <- eqls_raw |> count(ISO3166_Country)

eqls_raw %>%
  dplyr::count(ISO3166_Country) %>%
  print(n = nrow(.))

eqls_iso_country <-
  eqls_raw |>
  mutate(iso_code = str_extract(ISO3166_Country, "([^:]+)$"))

# Check whether we have done it correctly - randomly select 50 rows
eqls_iso_country |> select(ISO3166_Country, iso_code) |> slice_sample(n = 50) |> print(n = Inf)


eqls_country_clean <- left_join(eqls_iso_country, iso_country_codes, by = "iso_code")

#check the country is correct
eqls_country_clean |> select(ISO3166_Country, iso_code, `Country Name`) |> slice_sample(n = 50) |> print(n = Inf)

#rename column `Country Name`
eqls_country_clean <-
  eqls_country_clean |>
  mutate(country_name = `Country Name`)

glimpse(eqls_country_clean)

# SELECT INTERESTING DATA -------------------------------------------------

eqls_select <-
  eqls_country_clean |>
  select(UniqueID,                  # participant ID
         Wave,                      # Wave of data collection
         country_name,              # country name
         iso_code,                  # iso code of country
         Y11_Q31,                   # marital status
         Y11_Q32,                   # number of children
         Y11_Q49,                   # rural/urban living
         Y11_Agecategory,           # Age in 5 categories
         Y11_ISCEDsimple,           # highest education completed
         Y11_HH2a,                  # gender
         Y11_EmploymentStatus,      # Employment - 7 groups
         Y11_Q24,                   # Can most people be trusted?
         Y11_Q21a,                  # How frequently attend religious services?
         Y11_Q21b,                  # How frequently use the Internet other than for work?
         Y11_Q21c,                  # How frequently take part in sports or exercise?
         Y11_Q21d,                  # How frequently participate in social activities?
         Y11_Q22a,                  # How often worked unpaid for community services last 12 months?
         Y11_Q22b,                  # How often worked unpaid for education/cultural etc organisation last 12 months?
         Y11_Q22c,                  # How often worked unpaid for social movements/charities last 12 months?
         Y11_Q22d,                  # How often worked unpaid for political parties or trade unions last 12 months?
         Y11_Q22e,                  # How often worked unpaid for other voluntary org last 12 months?
         Y11_Volunteering,          # Volunteering frequency
         Y11_Q29e,                  # Feel left out of society?
         Y11_Q29f,                  # Can't find the way because life has become so complicated?
         Y11_Q29g,                  # The value of what I do is not recognised by others?
         Y11_Q29h,                  # People look down on me because of my job situation or income?
         Y11_Q29i,                  # Feel close to people in the area where I live
         Y11_SocExIndex,            # Social Exclusion Index
         Y11_Q45a,                  #	How often felt cheerful and in good spirits last 2 weeks?
         Y11_Q45b,                  #	How often felt calm and relaxed last 2 weeks?
         Y11_Q45c,                  #	How often felt active and vigorous last 2 weeks?
         Y11_Q45d,                  #	How often woke up feeling fresh and rested last 2 weeks?
         Y11_Q45e,                  #	How often felt your daily life has been filled with things that interest you last 2 weeks?
         Y11_Q46a,                  #	How often felt particularly tense last 2 weeks?
         Y11_Q46b,                  #	How often felt lonely last 2 weeks?
         Y11_Q46c,	                # How often felt downhearted and depressed last 2 weeks?
         Y11_MWIndex,               # WHO-5 mental wellbeing index
         Y11_Q12a,                  #	Come home from work too tired to do some of the household jobs
         Y11_Q12b,                  #	Difficult to fulfil family responsibilities because of the time at work
         Y11_Q12c,                  #	Difficult to concentrate at work because of family responsibilities
         Y11_Strainbasedconflict,   # Work-life balance conflict?
         Y11_Q7,                    # How many hours do you work in 1st job?
         Y11_Q7b,                   # How many hours per week worked in the additional job?
         DV_Q7                      # DV: Total number of working hours
  )

# compute total working hrs across first, second and other additional work
# If values exist in both columns add the hours together into one score
eqls_work_hrs <-
  eqls_select |>
  rowwise() |>
  mutate(work_hrs = if_else(is.na(Y11_Q7), Y11_Q7b,
                            if_else(is.na(Y11_Q7b), Y11_Q7,
                                    Y11_Q7 + Y11_Q7b)
  )
  ) |>
  ungroup()

## Check outcome
eqls_work_hrs |>select(Y11_Q7, Y11_Q7b, work_hrs) |> slice_sample(n = 50) |> print(n = Inf)
eqls_work_hrs |> select(Y11_Q7, Y11_Q7b, work_hrs) |> naniar::vis_miss(warn_large_data = FALSE)

sum(is.na(eqls_work_hrs$Y11_Q7))
sum(is.na(eqls_work_hrs$work_hrs))

eqls_work_hrs |> count(is.na(Y11_Q7), is.na(Y11_Q7b))

# INSPECT DATA ------------------------------------------------------------

## Check for missing data
# naniar::vis_miss(eqls_work_hrs, warn_large_data = FALSE)



## Check for interesting relationships
eqls_work_hrs |>
  select(Y11_SocExIndex,
         Y11_Volunteering,
         Y11_Strainbasedconflict,
         Y11_MWIndex) |>
  correlation::correlation()

eqls_work_hrs |>
  select(Y11_SocExIndex,
         Y11_Volunteering,
         Y11_Strainbasedconflict,
         Y11_MWIndex) |>
  pivot_longer(names_to = 'variable',
               cols = everything()) |>
  group_by(variable) |>
  na.omit() |>
  summarise(mean = mean(value))


eqls_work_hrs |>
  ggplot(aes(x =  as_factor(Y11_Agecategory),
             y = Y11_Strainbasedconflict,
             fill = country_name)) +
  geom_boxplot(outliers = FALSE) +
  facet_wrap(~ country_name) +
  coord_flip()

eqls_work_hrs |>
  ggplot(aes(x = Y11_Q29e,
             y = as_factor(Y11_HH2a),
             fill = as_factor(Y11_HH2a))) +
  geom_boxplot(outliers = TRUE) +
  coord_flip() +
  guides(fill = "none")

# Checking countries for multiple group comparison and Social Exclusion Index
eqls_work_hrs |>
  # filter(country_name == "Sweden" |
  #          country_name == "Norway" |
  #          country_name == "Bulgaria" |
  #          country_name == "France"
  #          ) |>
  ggplot(aes(x =  as_factor(country_name),
             y = Y11_SocExIndex,
             fill = country_name)) +
  geom_boxplot() +
  coord_flip()


eqls_work_hrs |>
  count(Y11_SocExIndex)


range(eqls_work_hrs$Y11_SocExIndex, na.rm = TRUE)




# RENAME VARIABLE NAMES ---------------------------------------------------

# select(UniqueID,                  # participant ID
#        country_name,              # country name
#        iso_code,                  # iso code of country
#        Y11_Q31,                   # marital status
#        Y11_Q32,                   # number of children
#        Y11_Q49,                   # rural/urban living
#        Y11_Agecategory,           # Age in 5 categories
#        Y11_ISCEDsimple,           # highest education completed
#        Y11_HH2a,                  # gender
#        Y11_EmploymentStatus,      # Employment - 7 groups
#        Y11_Q24,                   # Can most people be trusted?
#        Y11_Q21a,                  # How frequently attend religious services?
#        Y11_Q21b,                  # How frequently use the Internet other than for work?
#        Y11_Q21c,                  # How frequently take part in sports or exercise?
#        Y11_Q21d,                  # How frequently participate in social activities?
#        Y11_Q22a,                  # How often worked unpaid for community services last 12 months?
#        Y11_Q22b,                  # How often worked unpaid for education/cultural etc organisation last 12 months?
#        Y11_Q22c,                  # How often worked unpaid for social movements/charities last 12 months?
#        Y11_Q22d,                  # How often worked unpaid for political parties or trade unions last 12 months?
#        Y11_Q22e,                  # How often worked unpaid for other voluntary org last 12 months?
#        Y11_Volunteering,          # Volunteering frequency
#        Y11_Q29e,                  # Feel left out of society?
#        Y11_Q29f,                  # Can't find the way because life has become so complicated?
#        Y11_Q29g,                  # The value of what I do is not recognised by others?
#        Y11_Q29h,                  # People look down on me because of my job situation or income?
#        Y11_Q29i,                  # Feel close to people in the area where I live
#        Y11_SocExIndex,            # Social Exclusion Index
#        Y11_Q45a,                  #	How often felt cheerful and in good spirits last 2 weeks?
#        Y11_Q45b,                  #	How often felt calm and relaxed last 2 weeks?
#        Y11_Q45c,                  #	How often felt active and vigorous last 2 weeks?
#        Y11_Q45d,                  #	How often woke up feeling fresh and rested last 2 weeks?
#        Y11_Q45e,                  #	How often felt your daily life has been filled with things that interest you last 2 weeks?
#        Y11_Q46a,                  #	How often felt particularly tense last 2 weeks?
#        Y11_Q46b,                  #	How often felt lonely last 2 weeks?
#        Y11_Q46c,	                # How often felt downhearted and depressed last 2 weeks?
#        Y11_MWIndex,               # WHO-5 mental wellbeing index
#        Y11_Q12a,                  #	Come home from work too tired to do some of the household jobs
#        Y11_Q12b,                  #	Difficult to fulfil family responsibilities because of the time at work
#        Y11_Q12c,                  #	Difficult to concentrate at work because of family responsibilities
#        Y11_Strainbasedconflict,   # Work-life balance conflict?
#        Y11_Q7,                    # How many hours do you work in 1st job?
#        Y11_Q7b,                   # How many hours per week worked in the additional job?
#        DV_Q7                      # DV: Total number of working hours

eqls_renamed <-
  eqls_work_hrs |>
  rename(
    id                        = UniqueID,
    wave                      = Wave,                      # wave 2007 or 2011
    marital_status            = Y11_Q31,                   # marital status
    num_of_children           = Y11_Q32,                   # number of children
    rural_urban_living        = Y11_Q49,                   # rural/urban living
    age_category              = Y11_Agecategory,           # Age in 5 categories
    education                 = Y11_ISCEDsimple,           # highest education completed
    gender                    = Y11_HH2a,                  # gender
    employment                = Y11_EmploymentStatus,      # Employment - 7 groups
    trust_people              = Y11_Q24,                   # Can most people be trusted?
    freq_rel_service_use      = Y11_Q21a,                  # How frequently attend religious services?
    freq_internet_personal    = Y11_Q21b,                  # How frequently use the Internet other than for work?
    freq_sports               = Y11_Q21c,                  # How frequently take part in sports or exercise?
    freq_social_activities    = Y11_Q21d,                  # How frequently participate in social activities?
    vol_community_service     = Y11_Q22a,                  # How often worked unpaid for community services last 12 months?
    vol_education_cult_org    = Y11_Q22b,                  # How often worked unpaid for education/cultural etc organisation last 12 months?
    vol_social_charities      = Y11_Q22c,                  # How often worked unpaid for social movements/charities last 12 months?
    vol_political_parties     = Y11_Q22d,                  # How often worked unpaid for political parties or trade unions last 12 months?
    vol_other_organisation    = Y11_Q22e,                  # How often worked unpaid for other voluntary org last 12 months?
    volunteering_frequency    = Y11_Volunteering,          # Volunteering frequency
    sei_left_out_soc          = Y11_Q29e,                  # Feel left out of society?
    sei_life_is_complicated   = Y11_Q29f,                  # Can't find the way because life has become so complicated?
    sei_not_recognised        = Y11_Q29g,                  # The value of what I do is not recognised by others?
    sei_looked_down           = Y11_Q29h,                  # People look down on me because of my job situation or income?
    sei_feel_close_to_people  = Y11_Q29i,                  # Feel close to people in the area where I live
    sei                       = Y11_SocExIndex,            # Social Exclusion Index
    mwbi_felt_cheerful        = Y11_Q45a,                  #	How often felt cheerful and in good spirits last 2 weeks?
    mwbi_felt_calm            = Y11_Q45b,                  #	How often felt calm and relaxed last 2 weeks?
    mwbi_felt_active          = Y11_Q45c,                  #	How often felt active and vigorous last 2 weeks?
    mwbi_felt_fresh           = Y11_Q45d,                  #	How often woke up feeling fresh and rested last 2 weeks?
    mwbi_life_is_interesting  = Y11_Q45e,                  #	How often felt your daily life has been filled with things that interest you last 2 weeks?
    mwbi_felt_tense           = Y11_Q46a,                  #	How often felt particularly tense last 2 weeks?
    mwbi_felt_lonely          = Y11_Q46b,                  #	How often felt lonely last 2 weeks?
    mwbi_felt_downhearted     = Y11_Q46c,	                # How often felt downhearted and depressed last 2 weeks?
    mwbi                      = Y11_MWIndex,               # WHO-5 mental wellbeing index
    wlbc_too_tired_household  = Y11_Q12a,                 #	Come home from work too tired to do some of the household jobs
    wlbc_fam_responsibilities = Y11_Q12b,                 #	Difficult to fulfil family responsibilities because of the time at work
    wlbc_cannot_focus_on_work = Y11_Q12c,                 #	Difficult to concentrate at work because of family responsibilities
    wlbc                      = Y11_Strainbasedconflict,  # Work-life balance conflict?
    hrs_work_first_job        = Y11_Q7,                    # How many hours do you work in 1st job?
    hrs_work_additional_job   = Y11_Q7b,                   # How many hours per week worked in the additional job?
    total_hrs_working         = DV_Q7                      # DV: Total number of working hours)
  )

# REPLACE NUMERIC FACTOR LEVELS WITH ACTUAL CATEGORY NAMES ----------------

## num_of_children ----

# 5 = 5 or more children

# Replace '5' with category label and convert to ordinal variable
eqls_clean_factors <-
eqls_renamed |>
  mutate(num_of_children = if_else(as_factor(num_of_children) == "5", "5 or more children", as_factor(num_of_children)),
         num_of_children = factor(num_of_children, ordered = TRUE))

# Check
eqls_clean_factors |> count(num_of_children)


## marital_status ----

# 1 = Married or living with partner
# 2 = Separated or divorced and not living with partner
# 3 = Widowed and not living with partner
# 4 = Never married and not living with partner

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(marital_status = case_when(
    marital_status == 1 ~ "Married or living with partner",
    marital_status == 2 ~ "Separated or divorced and not living with partner",
    marital_status == 3 ~ "Widowed and not living with partner",
    marital_status == 4 ~ "Never married and not living with partner"
    ),
    marital_status = as_factor(marital_status)
  )

# check
eqls_clean_factors |> count(marital_status)


## rural_urban_living ----

# 1 = The open countryside
# 2 = A village/small town
# 3 = A medium to large town
# 4 = A city or city suburb

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(rural_urban_living = case_when(
    rural_urban_living == 1 ~ "The open countryside",
    rural_urban_living == 2 ~ "A village/small town",
    rural_urban_living == 3 ~ "A medium to large town",
    rural_urban_living == 4 ~ "A city or city suburb"
  ),
  rural_urban_living = as_factor(rural_urban_living)
  )

# check
eqls_clean_factors |> count(rural_urban_living)

## age_category ----

# 1 = 18-24
# 2 = 25-34
# 3 = 35-49
# 4 = 50-64
# 5 = 65+

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(age_category = case_when(
    age_category == 1 ~ "18-24",
    age_category == 2 ~ "25-34",
    age_category == 3 ~ "35-49",
    age_category == 4 ~ "50-64",
    age_category == 5 ~ "65+"
  ),
  age_category = factor(age_category, ordered = TRUE)
  )

eqls_clean_factors |> count(age_category)

## education ----

# 1 = No education completed (ISCED 0)
# 2 = Primary education (ISCED 1)
# 3 = Lower secondary education (ISCED 2)
# 4 = Upper secondary education (ISCED 3)
# 5 = Post-secondary including pre-vocational or vocational education but not tertiary (ISCED 4)
# 6 = Tertiary education – first level (ISCED 5)
# 7 = Tertiary education – advanced level (ISCED 6)
# 8 = Completed education abroad"

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(education = case_when(
    education == 1 ~ "No education completed (ISCED 0)",
    education == 2 ~ "Primary education (ISCED 1)",
    education == 3 ~ "Lower secondary education (ISCED 2)",
    education == 4 ~ "Upper secondary education (ISCED 3)",
    education == 5 ~ "Post-secondary including pre-vocational or vocational education but not tertiary (ISCED 4)",
    education == 6 ~ "Tertiary education – first level (ISCED 5)",
    education == 7 ~ "Tertiary education – advanced level (ISCED 6)",
    education == 8 ~ "Completed education abroad"
  ),
  education = factor(education)
  )

eqls_clean_factors |> count(education)

## gender ----

# 1 = Male
# 2 = Female

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(gender = case_when(
    gender == 1 ~ "Male",
    gender == 2 ~ "Female"
  ),
  gender = as_factor(gender)
  )

eqls_clean_factors |> count(gender)

## employment ----

# 1 = Employed (includes on leave)
# 2 = Unemployed
# 3 = Unable to work - disability/illness
# 4 = Retired
# 5 = Homemaker
# 6 = Student
# 7 = Other

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(employment = case_when(
    employment == 1 ~ "Employed (includes on leave)",
    employment == 2 ~ "Unemployed",
    employment == 3 ~ "Unable to work - disability/illness",
    employment == 4 ~ "Retired",
    employment == 5 ~ "Homemaker",
    employment == 6 ~ "Student",
    employment == 7 ~ "Other"
  ),
  employment = as_factor(employment)
  )

## Wave recoding

# 2 = 2007
# 3 = 2011

eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(wave = case_when(
    wave == 2 ~ "2007",
    wave == 3 ~ "2011"
  ),
  wave = as_factor(wave)
  )

eqls_clean_factors |> count(wave)

## Conversions to factors (clean-up)
eqls_clean_factors <-
  eqls_clean_factors |>
  mutate(country_name = as_factor(country_name),
         iso_code     = as_factor(iso_code)
         )



# REMOVE VARIABLES NOT NEEDED ANYMORE -------------------------------------

eqls_clean_factors <-
  eqls_clean_factors |>
  select(-total_hrs_working)



# FIX: NON-ASCII strings --------------------------------------------------

## In response to the following warning:
##
## Warning: found non-ASCII strings
## 'Tertiary education <e2><80><93> advanced level (ISCED 6)' in object 'eqls'
## 'Tertiary education <e2><80><93> first level (ISCED 5)' in object 'eqls'

## Function to replace non-ASCII en dash with ASCII hyphen
replace_non_ascii <- function(x) {
  str_replace_all(x, "\u2013", "-")  # Replace en dash (U+2013) with hyphen
}

## Apply the replacement to the entire dataset
eqls_ascii_strings <-
  eqls %>%
  mutate(across(everything(), ~ replace_non_ascii(.)))

# FINAL DATASET -----------------------------------------------------------

eqls <- eqls_ascii_strings
