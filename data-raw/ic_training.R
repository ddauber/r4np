# Create dataset for paired comparison of categorical variables

# # Anonymise data and create IDs
#
# ic_training <- ic_training_raw %>%
#   mutate(name = paste(first_name, last_name, sep=" "))
#
# filter <- ic_training %>%
#   group_by(name) %>%
#   summarise(n = n()) %>%
#   filter(n == 1)
#
# ic_training <- anti_join(ic_training, filter, by = "name")
#
# ic_training <- ic_training %>%
#   filter(test_phase != "post-training 2")
#
# # Select variables of interest
# ic_training <- ic_training %>%
#   select(name, test_phase:cl_adjusting_communication)
#
# # Replace real names with made up names
# ## check unique names
#
# filter2 <- ic_training %>%
#   na.omit() %>%
#   group_by(name) %>%
#   summarise(n = n()) %>%
#   filter(n == 1)
#
# ic_training <- anti_join(ic_training, filter2, by = "name")
#
# # remove NA
# ic_training <- ic_training %>%
#   na.omit()
#
# # generate random names
# # random_names <- randomNames::randomNames(48, ethnicity = c(1,2,3,4,5,6))
# new_names <- tibble(new_names = random_names)
#
# # Assign random names
# real_names <- ic_training %>% distinct(name)
#
# name_lookup <- cbind(real_names, new_names)
#
# # Add new names column
#
# ic_training <- left_join(ic_training, name_lookup, by = "name")
#
# # Remove real names and rename column
# ic_training <- ic_training %>%
#   select(-name) %>%
#   rename(name = new_names) %>%
#   relocate(name)
#
# # write csv file to disk
# write_csv(ic_training, "data-raw/ic_training.csv")

# Import original data
ic_training <- read_csv("data-raw/ic_training.csv")

# Select columns of interest
ic_training <- ic_training %>%
  select(name, test_phase, starts_with("c"))

# Create scores for each category
ic_training <- ic_training %>%
  na.omit() %>%
  rowwise(name) %>%
  mutate(communication = mean(c_across(starts_with("cc"))),
         teamwork = mean(c_across(starts_with("ct"))),
         leadership = mean(c_across(starts_with("cl")))
         ) %>%
  ungroup()

divider <- function(var) {
  forcats::as_factor(ifelse({{ var }} >= 3.5, "yes", "no"))
}

divider3 <- function(var) {
  as_factor(case_when({{ var }} <= 2 ~ "low",
                      {{ var }} >= 5 ~ "high",
                      TRUE ~ "medium")
            )
}

ic_training <- ic_training %>%
  mutate(communication2 =divider(communication),
         teamwork2 = divider(teamwork),
         leadership2 = divider(leadership)
         )

ic_training <- ic_training %>%
  mutate(communication3 = divider3(communication),
         teamwork3 = divider3(teamwork),
         leadership3 = divider3(leadership)
  )

glimpse(ic_training)

# Reorder factor levels for test_phase

ic_training <- ic_training %>%
  mutate(training = fct_relevel(test_phase, "pre-training", "post-training"))

relevel2 <- function(var) {
  forcats::fct_relevel({{ var }}, "yes", "no")
}

relevel3 <- function(var) {
  forcats::fct_relevel({{ var }}, "high", "medium", "low")
}

ic_training <- ic_training %>%
  mutate(communication2 = relevel2(communication2),
         teamwork2 = relevel2(teamwork2),
         leadership2 = relevel2(leadership2)
         )

ic_training <- ic_training %>%
  mutate(communication3 = relevel3(communication3),
         teamwork3 = relevel3(teamwork3),
         leadership3 = relevel3(leadership3)
  )

# Test output tables
ic_training %>%
  count(training, communication2) %>%
  pivot_wider(id_cols = training,
              names_from = communication2,
              values_from = n)

ic_training %>%
  count(training, teamwork3) %>%
  pivot_wider(id_cols = training,
              names_from = teamwork3,
              values_from = n)

# Clean up tibble
glimpse(ic_training)

ic_training <- ic_training %>%
  rename(test = training) %>%
  select(name, test, communication:leadership3)


glimpse(ic_training)

# Set as new dataset
usethis::use_data(ic_training, overwrite = TRUE)
