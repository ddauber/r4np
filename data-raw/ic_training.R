# Create dataset for paired comparison of categorical variables

# Import original data
ic_training <- read_csv("data-raw/ic_training.csv")

# Select columns of interest
ic_training <- ic_training %>%
  select(rowname, test_phase, starts_with("c"))

# Create scores for each category
ic_training <- ic_training %>%
  na.omit() %>%
  rowwise(rowname) %>%
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
  select(test, communication:leadership3)


glimpse(ic_training)

# Set as new dataset
usethis::use_data(ic_training)
