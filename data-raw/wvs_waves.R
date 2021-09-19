# CREATE wvs_wave data set

# Load required packages
library(tidyverse)

# # Decide which variables to use
#
# glimpse(WVS_TimeSeries_1981_2020_v2_0.)
#
# df <- as_tibble(WVS_TimeSeries_1981_2020_v2_0.)
#
# df %>% count(COUNTRY_ALPHA) %>% print(n = Inf)
#
#
# # Find countries with most waves
# df %>%
#   group_by(COUNTRY_ALPHA) %>%
#   count(S002VS) %>%
#   count(COUNTRY_ALPHA) %>%
#   filter(n == 7) %>%
#   print(n = Inf)
#
# df_select <- df %>%
#   filter(COUNTRY_ALPHA == "ARG" |
#            COUNTRY_ALPHA == "JPN" |
#            # COUNTRY_ALPHA == "KOR" |
#            COUNTRY_ALPHA == "MEX" |
#            COUNTRY_ALPHA == "USA")
#
#
# # A170 Satisfaction with life
# # A173 Freedom of choice
# # 1 = low
# # 10 = high
#
# # clean up
# df_select <- df_select %>%
#   select(S002VS, COUNTRY_ALPHA, A170, A173) %>%
#   rename(wave = S002VS,
#          country = COUNTRY_ALPHA,
#          satisfaction = A170,
#          freedom_of_choice = A173
#   ) %>%
#   mutate(wave = as_factor(wave),
#          country = as_factor(country))
#
# # remove invalid responses (i.e. negative ones)
# df_select <- df_select %>%
#   filter(across(where(is.integer), ~ .x > 0))

## ALL OF THE ABOVE HAS ALREADY BEEN APPLIED IN THE RAW DATA FILE

# multiple countries with multiple measures over time

df_select <- wvs_waves %>%
    mutate(country = as_factor(country))

# recode factor levels for 'wave'
df_select <- df_select %>%
  mutate(wave = as_factor(paste("w", wave, sep = "")))

df_select %>%
  ungroup() %>%
  ggplot(aes(x = wave,
             y = satisfaction,
             fill = country)) +
  geom_boxplot()

# According to this plot it might be worth removing the USA from this dataset to keep dataset smaller
# Not much has changed in the USA

df_select <- df_select %>%
  filter(country != "USA")

# compute it

df_select %>%
  rstatix::anova_test(satisfaction ~ country,
                      within = wave,
                      detailed = TRUE)

effectsize::interpret_eta_squared(0.073)

# Add IDs for participants

df_select %>%
  group_by(country, wave) %>%
  sample_n(100) %>%
  summarise(obs = n()) %>%
  print(n = Inf)

# Create equally large sub-samples of datasets
df_select_sub <- df_select %>%
  group_by(country, wave) %>%
  sample_n(100) %>%
  ungroup()

row_id_arg <- rep(1:100, times  = 7) %>% as_tibble()
row_id_jpn <- rep(101:200, times  = 7) %>% as_tibble()
row_id_mex <- rep(201:300, times  = 7) %>% as_tibble()

row_ids <- rbind(row_id_arg, row_id_jpn, row_id_mex)

df_select_sub <- df_select_sub %>% mutate(id = as_factor(row_ids$value)) %>% relocate(id)


# rename dataset for storing
wvs_waves <- df_select_sub

# Add to package
usethis::use_data(wvs_waves, overwrite = TRUE)
