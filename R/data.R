# ------------------------------------------------------------------------------

#' World Value Survey \emph{(Extract)}
#'
#' A dataset which contains selected data from the World Value Survey.
#' This data was obtained in October 2020.
#'
#' @format A data frame with 8564 rows and 7 variables:
#' \describe{
#' \item{Participant ID}{\emph{Unique identifier for each participant}}
#' \item{Country name}{\emph{Country name, partially abbreviated}}
#' \item{Gender}{\emph{Gender of participant}}
#' \item{Age}{\emph{Age of participant at the time of data collection}}
#' \item{relationship_status}{\emph{Relationship status of participants}}
#' \item{Freedom.of.Choice}{Item: \emph{Some people feel they have completely
#' free choice and control over their lives, while other people feel that
#' what they do has no real effect on what happens to them. Indicate how much
#' freedom of choice and control you feel you have over the way your life
#' turns out | 1 ("no choice at all") to 10 ("a great deal of choice").}}
#' \item{Satisfaction-with-life}{Item: \emph{All things considered, how satisfied
#' are you with your life as a whole these days? | 1 (“completely dissatisfied”)
#' to 10 (“completely satisfied”)}}
#' }
#' @source World Value Survey (WVS) (\url{https://www.worldvaluessurvey.org})
"wvs"

# ------------------------------------------------------------------------------

#' World Value Survey \emph{(Extract)}
#'
#' A cleaned version of the \emph{wvs} dataset.
#'
#' @format A data frame with 8564 rows and 6 variables:
#' \describe{
#' \item{country}{\emph{Country name, partially abbreviated}}
#' \item{gender}{\emph{Gender of participant}}
#' \item{age}{\emph{Age of participant at the time of data collection}}
#' \item{relationship_status}{\emph{Relationship status of participants}}
#' \item{freedom_of_choice}{Item: \emph{Some people feel they have completely
#' free choice and control over their lives, while other people feel that
#' what they do has no real effect on what happens to them. Indicate how much
#' freedom of choice and control you feel you have over the way your life
#' turns out | 1 ("no choice at all") to 10 ("a great deal of choice").}}
#' \item{satisfaction}{Item: \emph{All things considered, how satisfied
#' are you with your life as a whole these days? | 1 (“completely dissatisfied”)
#' to 10 (“completely satisfied”)}}
#' }
#' @source World Value Survey (WVS) (\url{https://www.worldvaluessurvey.org})
"wvs_nona"

# ------------------------------------------------------------------------------

#' Global Education Profiler \emph{(random sample)}
#'
#' A dataset containing information about students' \emph{social integration (si)} experience at
#' their Higher Education Institutions and their \emph{communication skills (cs)} development.
#' For \emph{cs}, scores of 'actualy experience' and 'importance to me' are available. This
#' dataset only contains a random sample of 300 observations out of well over 12,000 students
#' as of August 2021.
#'
#' @format A data frame with 300 rows and 12 variables:
#' \describe{
#'   \item{age}{\emph{Age of participant}}
#'   \item{gender}{\emph{Gender of participant}}
#'   \item{level_of_study}{\emph{Degree level at the time of the research project}}
#'   \item{si_socialise_with_people_exp}{\emph{Extent to which participants have opportunities to socialise with people from diverse cultural backgrounds}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{si_supportive_friends_exp}{\emph{Extent to which participants have supportive friends with a diverse cultural background}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{si_time_socialising_exp}{\emph{Extent to which participants take time to socialise with people from diverse cultural backgrounds}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{cs_explain_ideas_imp}{\emph{Extent to which participants perceive improving in explaining ideas to others (importance)}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{cs_find_clarification_imp}{\emph{Extent to which participants are able to clarify what others mean (importance)}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{cs_learn_different_styles_imp}{\emph{Extent to which participants learn about other students communication styles (importance)}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{cs_explain_ideas_exp}{\emph{Extent to which participants perceive improving in explaining ideas to others (experience)}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{cs_find_clarification_exp}{\emph{Extent to which participants are able to clarify what others mean (experience)}
#'   | 1 ("not at all") to 6 ("very much")}
#'   \item{cs_learn_different_styles_exp}{\emph{Extent to which participants learn about other students communication styles (experience)}
#'   | 1 ("not at all") to 6 ("very much")}
#' }
#'
#' @source Global Education Profiler (\url{https://warwick.ac.uk/gep})
"gep"

# ------------------------------------------------------------------------------

#' Simpson's Paradox: A demonstration dataset \emph{(random sample)}
#'
#' A dataset to demonstrate the Simpson's Paradox.
#'
#' @format A data frame with 300 rows and 3 variables:
#' \describe{
#'   \item{performance}{\emph{Student's change in performance at school.}}
#'   \item{happiness}{\emph{Participant's change in happiness}}
#'   \item{group}{\emph{Group a participant belongs to, i.e. Teacher, Student, or Parent}}
#' }
#'
#' @source Dataset created with \emph{correlation::simulate_simpson()}
"simpson"

#' COVID-19 DATA
#'
#' A dataset which contains COVID cases and deaths, vaccination information and public
#' health social measures (PHSM) for each country covered by the WHO.
#'
#' @format A data frame with 142674 rows and 17 variables:
#' \describe{
#'   \item{date_reported}{Date when cases, deaths, PHSM, etc. were reported}
#'   \item{iso3}{ISO three-digit country identifier}
#'   \item{country}{Name of country}
#'   \item{new_cases}{# of new COVID cases}
#'   \item{cumulative_cases}{Total number of COVID cases}
#'   \item{cumulative_deaths}{Total number of deaths due to COVID}
#'   \item{fully_vaccinated}{Total number of fully vaccinated people}
#'   \item{masks}{Index of mask measures implemented (0-100)}
#'   \item{travel}{Index of travel measures implemented (0-100)}
#'   \item{gatherings}{Index of gathering measures implemented (0-100)}
#'   \item{schools}{Index of school measures implemented (0-100)}
#'   \item{businesses}{Index of business measures implemented (0-100)}
#'   \item{movements}{Index of movement measures implemented (0-100)}
#'   \item{global_index}{Global index of overall measures implemented (0-100)}
#'   \item{measures_in_place}{Lists all measures in place according to WHO taxanomy}
#'   \item{region}{Region a country is located in (WHO classification)}
#'   \item{population}{Population of a country as of 2016}
#' }
#'
#' @source World Health Organisation (WHO). Dataset retrieved on 2nd February 2023 from: \url{https://covid19.who.int/info/}.
#' WHO data is licensed under Creative Commons Attribution 4.0 International License (CC BY 4.0).
"covid"

# ------------------------------------------------------------------------------

#' IC Training Data
#'
#' A dataset which contains real-world pre- and post-training test scores for
#' Intercultural Communication trainees. Participants names were replaced with random names.
#'
#' @format A data frame with 96 rows and 11 variables:
#' \describe{
#'   \item{name}{Random names created with `randomName` package}
#'   \item{test}{Defines whether a test was performed before or after training}
#'   \item{communication}{Level of confidence in communication with people from diverse cultural backgrounds}
#'   \item{teamwork}{Level of confidence in working with people from diverse cultural backgrounds}
#'   \item{leadership}{Level of confidence in leading people from diverse cultural backgrounds}
#'   \item{communication2}{Factorised 'communication' with levels "yes and "no"}
#'   \item{teamwork2}{Factorised 'teamwork' with levels "yes and "no"}
#'   \item{leadership2}{Factorised 'leadership' with levels "yes and "no"}
#'   \item{communication3}{Factorised 'communication' with levels "high", "medium", and "low"}
#'   \item{teamwork3}{Factorised 'teamwork' with levels "high", "medium", and "low"}
#'   \item{leadership3}{Factorised 'leadership' with levels "high", "medium", and "low"}
#' }
#'
#' @source Research conducted at the University of Warwick (2018)
"ic_training"

# ------------------------------------------------------------------------------

#' World Value Survey (Waves)
#'
#' A dataset excerpt from the World Value Survey including 3 countries over 7 waves of data
#' collection.
#'
#' @format A data frame with 2100 rows and 5 variables:
#' \describe{
#'   \item{id}{Unique ID for each participant}
#'   \item{wave}{Random names created with `randomName` package}
#'   \item{country}{Defines whether a test was performed before or after training}
#'   \item{satisfaction}{Item: \emph{All things considered, how satisfied
#'         are you with your life as a whole these days? | 1 (“completely dissatisfied”)
#'         to 10 (“completely satisfied”)}}
#'   \item{freedom_of_choice}{Item: \emph{Some people feel they have completely
#'         free choice and control over their lives, while other people feel that
#'         what they do has no real effect on what happens to them. Indicate how much
#'         freedom of choice and control you feel you have over the way your life
#'         turns out | 1 ("no choice at all") to 10 ("a great deal of choice").}}
#' }
#'
#' @source World Value Survey (WVS). Data retrieve from \url{https://www.worldvaluessurvey.org}
"wvs_waves"

# ------------------------------------------------------------------------------

#' Halloween
#'
#' A dataset which contains data about Halloween consumer behaviour across the US,
#' the UK and Germany.
#'
#' @format A data frame with 5982 rows and 3 variables:
#' \describe{
#'   \item{expenses}{Expenses related to Halloween candies}
#'   \item{distance}{Distance covered while 'Trick-or-treating'}
#'   \item{country}{Participants country of residence}
#' }
#'
#' @source Ripped from the dying hands of the Pumpkin Lord.
"halloween"

# ------------------------------------------------------------------------------

#' Start and end dates/times of a questionnaire
#'
#' A dataset which contains start and end dates regarding the completion of a questionnaire.
#'
#' @format A data frame with 84 rows and 3 variables:
#' \describe{
#'   \item{id}{Unique identifier of participant}
#'   \item{start}{The date and time at which a participant started the questionnaire}
#'   \item{end}{The date and time at which a participant finished the questionnaire}
#' }
#'
#' @source A random selection of observations from the Global Education Profiler (GEP).
"quest_time"

# ------------------------------------------------------------------------------

#' People and Nature Survey for England, 2020-2023
#'
#' The People and Nature Survey for England is a study conducted to gather
#' data on how people use, enjoy, and benefit from the natural environment in England.
#'
#' @format A data frame with 3585 rows and 19 variables:
#' \describe{
#'   \item{region}{Different regions in England where data was collected.}
#'   \item{wave}{Data was collected in several waves. This provides opportunities to analyse data over time.}
#'   \item{time_in_green}{Item: \emph{In the last 12 months, how often, on average have you spent free time
#'                        outside in green and natural spaces?}}
#'   \item{ncs_easy_walking_distance}{Item: \emph{How much do you agree or disagree with the following statements
#'                                    relating to green and natural spaces locally: Within easy walking distance.}
#'                                    | 1 ("Strongly disagree") to 5 = ("Strongly agree").}
#'   \item{ncs_relax_unwind}{Item: \emph{How much do you agree or disagree with the following statements relating
#'                           to green and natural spaces locally: Places where I can relax and unwind.}
#'                           | 1 ("Strongly disagree") to 5 = ("Strongly agree").}
#'   \item{ncs_high_enough_standard}{Item: \emph{How much do you agree or disagree with the following statements
#'                                   relating to green and natural spaces locally: A high enough standard to want
#'                                   to spend time in.}
#'                                   | 1 ("Strongly disagree") to 5 = ("Strongly agree").}
#'   \item{imp_protect_environment}{Item: \emph{How important is protecting the environment to you personally?}
#'                                  | 1 ("Not at all important") to 5 = ("Very important").}
#'   \item{concerned_damaging_environment}{Item: \emph{How much do you agree or disagree with the following
#'                                         statement? I am concerned about damage to the natural environment.}
#'                                         | 1 ("Not at all important") to 5 = ("Very important").}
#'   \item{pick_up_litter}{Item: \emph{How often do you do the actions below when you have the opportunity?
#'                         When I see litter, I pick it up.}
#'                         | 1 ("Never") to 5 = ("Always / whenever I have the opportunity").}
#'   \item{vote_political_party}{Item: \emph{How often do you do the actions below when you have the opportunity?
#'                               I vote for political parties with strong environmental policies}
#'                               | 1 ("Never") to 5 = ("Always / whenever I have the opportunity").}
#'   \item{change_lifestyle}{Item: \emph{Are you going to make changes to your lifestyle to protect the environment
#'                           (for example by recycling rather than throwing things away, using your car less and
#'                           buying local food)?}}
#'   \item{wb_lonely}{Item: \emph{How often do you feel lonely?} | 1 ("Never") to 5 = ("Often / always").}
#'   \item{wb_satisfied}{Item: \emph{Overall, how satisfied are you with your life nowadays?} | 1 ("Not at all") to 10 = ("Completely").}
#'   \item{wb_worthwhile}{Item: \emph{Overall, how worthwhile are the things you do in your life?} | 1 ("Not at all") to 10 = ("Completely").}
#'   \item{wb_happy}{Item: \emph{How happy were you feeling yesterday?} | 1 ("Not at all") to 10 = ("Completely").}
#'   \item{wb_worried_anxious}{Item: \emph{How anxious were you feeling yesterday?} | 1 ("Not at all") to 10 = ("Completely").}
#'   \item{wb_worried_anxious_r}{This is the reverse-scored item for `wb_worried_anxious`.}
#'   \item{ncs}{Natural connectedness scale (latent variable based on `ncs` items).}
#'   \item{wellbeing}{Wellbeing (latent variable based on `wb` items).}
#' }
#'
#' @source Natural England. (2023). People and Nature Survey for England, 2020-2023: Open Access. 3rd Edition. UK Data Service. SN: 9092.
#'         DOI: \url{http://doi.org/10.5255/UKDA-SN-9092-3}
"pplnat"

# ------------------------------------------------------------------------------

#' European Quality of Life Survey Time Series, 2007 and 2011
#'
#' The EQLS dataset is a pan-European survey that captures both the objective conditions of citizens'
#' lives (e.g., employment, income, health) and their subjective perceptions, including life satisfaction
#' and happiness.
#'
#' @format A data frame with 79270 rows and 45 variables:
#' \describe{
#'   \item{id}{Participant unique ID}
#'   \item{wave}{Data was collected in several waves, 2007 and 2011. This allows comparing countries over time.}
#'   \item{country_name}{Name of country participants resides in.}
#'   \item{iso_code}{Country ISO code}
#'   \item{marital_status}{Marital status}
#'   \item{num_of_children}{Item: \emph{Number of children of your own}}
#'   \item{rural_urban_living}{Item: \emph{The area in which you live is...?}}
#'   \item{age_category}{Age of respondent}
#'   \item{education}{Highest level of education completed}
#'   \item{gender}{Gender of participant}
#'   \item{employment}{Employment status}
#'   \item{trust_people}{Item: \emph{Would you say that most people can be trusted?}
#'                                    | 1 ("You cannot be too careful") to 10 = ("Most people can be trusted").}
#'   \item{freq_rel_service_use}{Item: \emph{How frequently do you: Attend religious services, apart from weddings, funerals or christenings?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{freq_internet_personal}{Item: \emph{How frequently do you: Use the Internet other than for work?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{freq_sports}{Item: \emph{How frequently do you: Take part in sports or physical exercise?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{freq_social_activities}{Item: \emph{How frequently do you: Participate in social activities of a club, society, or an association?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{vol_community_service}{Item: \emph{How often unpaid voluntary work in the last 12 months: Community and social services?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_education_cult_org}{Item: \emph{How often unpaid voluntary work in the last 12 months: Education, cultural, sports or professional organisation?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_social_charities}{Item: \emph{How often unpaid voluntary work in the last 12 months: Social movements or charities?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_political_parties}{Item: \emph{How often unpaid voluntary work in the last 12 months: Political parties, trade unions?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_other_organisation}{Item: \emph{How often unpaid voluntary work in the last 12 months: Other voluntary organisations?
#'                                    | 1 ("Every week") to 5 = ("Not at all").}}
#'   \item{volunteering_frequency}{Volunteering frequency | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{sei_left_out_soc}{Item: \emph{I feel left out of society}.}
#'   \item{sei_life_is_complicated}{Item: \emph{Life has become so complicated today that I almost can’t find my way}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei_not_recognised}{Item: \emph{I feel that the value of what I do is not recognised by others}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei_looked_down}{Item: \emph{Some people look down on me because of my job situation or income}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei_feel_close_to_people}{Item: \emph{I feel close to people in the area where I live}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei}{Social Exclusion Index}
#'   \item{mwbi_felt_cheerful}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt cheerful and in good spirits}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_calm}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt calm and relaxed}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_active}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt active and vigorous}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_fresh}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I woke up feeling fresh and rested}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_life_is_interesting}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - My daily life has been filled with things that interest me}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_tense}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt particularly tense}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_lonely}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt lonely}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_downhearted}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt downhearted and depressed}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi}{WHO-5 mental wellbeing index}
#'   \item{wlbc_too_tired_household}{Item: \emph{I have come home from work too tired to do some of the household jobs which need to be done}
#'                                     | 1 ("Several times a week") to 6 = ("Less often/rarely").}
#'   \item{wlbc_fam_responsibilities}{Item: \emph{It has been difficult for me to fulfil my family responsibilities because of the amount of time I spend on the job}
#'                                     | 1 ("Several times a week") to 6 = ("Less often/rarely").}
#'   \item{wlbc_cannot_focus_on_work}{Item: \emph{I have found it difficult to concentrate at work because of my family responsibilities}
#'                                     | 1 ("Several times a week") to 6 = ("Less often/rarely").}
#'   \item{wlbc}{Work-life balance conflict}
#'   \item{hrs_work_first_job}{Item: \emph{How many hours do you normally work per week in your main job?} | (80hrs or more).}
#'   \item{hrs_work_additional_job}{Item: \emph{About how many hours per week did you work in this additional job?} | (60hrs or more).}
#'   \item{work_hrs}{The total number of working hours.}
#' }
#'
#' @source European Foundation for the Improvement of Living and Working Conditions. (2015).
#'         European Quality of Life Time Series, 2007 and 2011: Open Access. UK Data Service.
#'         SN: 7724, DOI: \url{http://doi.org/10.5255/UKDA-SN-7724-1}.
"eqls"

# ------------------------------------------------------------------------------

#' European Quality of Life Survey Time Series (2011 only)
#'
#' The EQLS dataset is a pan-European survey that captures both the objective conditions of citizens'
#' lives (e.g., employment, income, health) and their subjective perceptions, including life satisfaction
#' and happiness.
#'
#' @format A data frame with 43636 rows and 44 variables:
#' \describe{
#'   \item{id}{Participant unique ID}
#'   \item{wave}{Data was collected in several waves, 2007 and 2011. This allows comparing countries over time.}
#'   \item{country_name}{Name of country participants resides in.}
#'   \item{iso_code}{Country ISO code}
#'   \item{marital_status}{Marital status}
#'   \item{num_of_children}{Item: \emph{Number of children of your own}}
#'   \item{rural_urban_living}{Item: \emph{The area in which you live is...?}}
#'   \item{age_category}{Age of respondent}
#'   \item{education}{Highest level of education completed}
#'   \item{gender}{Gender of participant}
#'   \item{employment}{Employment status}
#'   \item{trust_people}{Item: \emph{Would you say that most people can be trusted?}
#'                                    | 1 ("You cannot be too careful") to 10 = ("Most people can be trusted").}
#'   \item{freq_rel_service_use}{Item: \emph{How frequently do you: Attend religious services, apart from weddings, funerals or christenings?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{freq_internet_personal}{Item: \emph{How frequently do you: Use the Internet other than for work?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{freq_sports}{Item: \emph{How frequently do you: Take part in sports or physical exercise?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{freq_social_activities}{Item: \emph{How frequently do you: Participate in social activities of a club, society, or an association?}
#'                                    | 1 ("Every day or almost every day") to 5 = ("Never").}
#'   \item{vol_community_service}{Item: \emph{How often unpaid voluntary work in the last 12 months: Community and social services?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_education_cult_org}{Item: \emph{How often unpaid voluntary work in the last 12 months: Education, cultural, sports or professional organisation?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_social_charities}{Item: \emph{How often unpaid voluntary work in the last 12 months: Social movements or charities?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_political_parties}{Item: \emph{How often unpaid voluntary work in the last 12 months: Political parties, trade unions?}
#'                                    | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{vol_other_organisation}{Item: \emph{How often unpaid voluntary work in the last 12 months: Other voluntary organisations?
#'                                    | 1 ("Every week") to 5 = ("Not at all").}}
#'   \item{volunteering_frequency}{Volunteering frequency | 1 ("Every week") to 5 = ("Not at all").}
#'   \item{sei_left_out_soc}{Item: \emph{I feel left out of society}.}
#'   \item{sei_life_is_complicated}{Item: \emph{Life has become so complicated today that I almost can’t find my way}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei_not_recognised}{Item: \emph{I feel that the value of what I do is not recognised by others}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei_looked_down}{Item: \emph{Some people look down on me because of my job situation or income}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei_feel_close_to_people}{Item: \emph{I feel close to people in the area where I live}
#'                                     | 1 ("Strongly agree") to 5 = ("Strongly disagree").}
#'   \item{sei}{Social Exclusion Index}
#'   \item{mwbi_felt_cheerful}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt cheerful and in good spirits}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_calm}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt calm and relaxed}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_active}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt active and vigorous}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_fresh}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I woke up feeling fresh and rested}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_life_is_interesting}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - My daily life has been filled with things that interest me}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_tense}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt particularly tense}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_lonely}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt lonely}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi_felt_downhearted}{Item: \emph{Which is closest to how you have been feeling over the last 2 weeks? - I have felt downhearted and depressed}
#'                                     | 1 ("All of the time") to 6 = ("At no time").}
#'   \item{mwbi}{WHO-5 mental wellbeing index}
#'   \item{wlbc_too_tired_household}{Item: \emph{I have come home from work too tired to do some of the household jobs which need to be done}
#'                                     | 1 ("Several times a week") to 6 = ("Less often/rarely").}
#'   \item{wlbc_fam_responsibilities}{Item: \emph{It has been difficult for me to fulfil my family responsibilities because of the amount of time I spend on the job}
#'                                     | 1 ("Several times a week") to 6 = ("Less often/rarely").}
#'   \item{wlbc_cannot_focus_on_work}{Item: \emph{I have found it difficult to concentrate at work because of my family responsibilities}
#'                                     | 1 ("Several times a week") to 6 = ("Less often/rarely").}
#'   \item{wlbc}{Work-life balance conflict}
#'   \item{hrs_work_first_job}{Item: \emph{How many hours do you normally work per week in your main job?} | (80hrs or more).}
#'   \item{hrs_work_additional_job}{Item: \emph{About how many hours per week did you work in this additional job?} | (60hrs or more).}
#'   \item{work_hrs}{The total number of working hours.}
#' }
#'
#' @source European Foundation for the Improvement of Living and Working Conditions. (2015).
#'         European Quality of Life Time Series, 2007 and 2011: Open Access. UK Data Service.
#'         SN: 7724, DOI: \url{http://doi.org/10.5255/UKDA-SN-7724-1}.
"eqls_2011"

# ------------------------------------------------------------------------------

#' European Quality of Life Survey Time Series (2011 only, country aggregates)
#'
#' The EQLS dataset is a pan-European survey that captures both the objective conditions of citizens'
#' lives (e.g., employment, income, health) and their subjective perceptions, including life satisfaction
#' and happiness.
#'
#' @format A data frame with 32 rows and 5 variables:
#' \describe{
#'   \item{country_name}{Name of country participants resides in.}
#'   \item{trust_people}{Item: \emph{Would you say that most people can be trusted?}
#'                                    | 1 ("You cannot be too careful") to 10 = ("Most people can be trusted").}
#'   \item{sei}{Social Exclusion Index}
#'   \item{mwbi}{WHO-5 mental wellbeing index}
#'   \item{wlbc}{Work-life balance conflict}
#' }
#'
#' @source European Foundation for the Improvement of Living and Working Conditions. (2015).
#'         European Quality of Life Time Series, 2007 and 2011: Open Access. UK Data Service.
#'         SN: 7724, DOI: \url{http://doi.org/10.5255/UKDA-SN-7724-1}.
"eqls_country_2011"

# ------------------------------------------------------------------------------

#' The Health Index for England (2015-2021)
#'
#' A selected range of variables from the the Health Index for England dataset, which is
#' a comprehensive measure of national health, considering outcomes, behaviors, personal
#' circumstances, and environmental factors. It provides a single health score and allows
#' detailed breakdowns by location and topic, facilitating comparisons over time.
#'
#' @format A data frame with 2149 rows and 21 variables:
#' \describe{
#'   \item{area_name}{The area the data was collected from.}
#'   \item{region}{Regional categorisation of areas.}
#'   \item{year}{The year data was collected.}
#'   \item{activities_in_life_are_worthwhile}{The average score of respondents (16+) on how
#'                                            meaningful they find their life's activities.}
#'   \item{early_years_development}{The percentage of 5-year-olds meeting the expected early
#'                                  learning goals in personal, social, emotional, physical,
#'                                  communication, language, mathematics, and literacy at the
#'                                  end of the Early Years Foundation Stage (EYFS).}
#'   \item{feelings_of_anxiety}{The average anxiety score of respondents (16+) when asked
#'                              how they felt the day before.}
#'   \item{happiness}{The average happiness score of respondents (16+) when asked
#'                              how they felt the day before.}
#'   \item{healthy_eating}{The percentage of adults (16+) who report eating five or more
#'                          portions of fruit and vegetables on a 'usual day'.}
#'   \item{high_blood_pressure}{The percentage of people reporting high blood pressure
#'                              (hypertension) - not based on GP records but survey responses.}
#'   \item{household_overcrowding}{The percentage of households considered overcrowded, based
#'                                 on a standard calculation comparing the number of required
#'                                 rooms to the actual number of rooms.}
#'   \item{life_expectancy}{Period life expectancy at birth is the average number of years a
#'                          person born in a specific year and area would live if they experienced
#'                          that area's current age-specific mortality rates throughout their life.}
#'   \item{life_satisfaction}{The average life satisfaction score of respondents aged 16 and over.}
#'   \item{low_level_crime}{The number of police-recorded low-level crimes per 1,000 people, with
#'                          bicycle theft and shoplifting used as indicators of overall rates.}
#'   \item{mental_health_conditions}{The percentage of people reporting a mental health condition,
#'                                   such as depression or anxiety- not based on GP records but
#'                                   survey responses.}
#'   \item{overweight_and_obesity_in_adults}{The percentage of adults (18+) who are overweight or
#'                                           obese, based on self-reported height and weight in a survey.}
#'   \item{overweight_and_obesity_in_children}{The percentage of children in Reception (aged 4-5)
#'                                             and Year 6 (aged 10-11) who are overweight or obese.}
#'   \item{physical_activity}{The percentage of adults (19+) reporting physical activity of 150 minutes
#'                            or more per week.}
#'   \item{rough_sleeping}{The number of people sleeping outdoors on a single night in October or November,
#'                         per 100,000 residents.}
#'   \item{smoking}{The percentage of adults (18+) who currently smoke cigarettes.}
#'   \item{unemployment}{The percentage of adults (16+) actively seeking work in the past four
#'                       weeks and available to start within two weeks, relative to the economically
#'                       active population.}
#'   \item{young_ppl_edu_empl_appren}{The percentage of 16 and 17-year-olds in sustained education,
#'                                    employment, or apprenticeships one year after key stage 4 (after
#'                                    school Year 11).}
#' }
#'
#' @source Office for National Statistics (ONS), released 16 June 2023, ONS website, Health Index Scores, England,
#' Url: \url{https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/datasets/healthindexscoresengland}.
"hie"

# ------------------------------------------------------------------------------

#' The Health Index for England (2021)
#'
#' A selected range of variables from the the Health Index for England dataset, which is
#' a comprehensive measure of national health, considering outcomes, behaviors, personal
#' circumstances, and environmental factors. It provides a single health score and allows
#' detailed breakdowns by location and topic, facilitating comparisons over time. This
#' dataset only contains data collected in 2021.
#'
#' @format A data frame with 307 rows and 21 variables:
#' \describe{
#'   \item{area_name}{The area the data was collected from.}
#'   \item{region}{Regional categorisation of areas.}
#'   \item{year}{The year data was collected.}
#'   \item{activities_in_life_are_worthwhile}{The average score of respondents (16+) on how
#'                                            meaningful they find their life's activities.}
#'   \item{early_years_development}{The percentage of 5-year-olds meeting the expected early
#'                                  learning goals in personal, social, emotional, physical,
#'                                  communication, language, mathematics, and literacy at the
#'                                  end of the Early Years Foundation Stage (EYFS).}
#'   \item{feelings_of_anxiety}{The average anxiety score of respondents (16+) when asked
#'                              how they felt the day before.}
#'   \item{happiness}{The average happiness score of respondents (16+) when asked
#'                              how they felt the day before.}
#'   \item{healthy_eating}{The percentage of adults (16+) who report eating five or more
#'                          portions of fruit and vegetables on a 'usual day'.}
#'   \item{high_blood_pressure}{The percentage of people reporting high blood pressure
#'                              (hypertension) - not based on GP records but survey responses.}
#'   \item{household_overcrowding}{The percentage of households considered overcrowded, based
#'                                 on a standard calculation comparing the number of required
#'                                 rooms to the actual number of rooms.}
#'   \item{life_expectancy}{Period life expectancy at birth is the average number of years a
#'                          person born in a specific year and area would live if they experienced
#'                          that area's current age-specific mortality rates throughout their life.}
#'   \item{life_satisfaction}{The average life satisfaction score of respondents aged 16 and over.}
#'   \item{low_level_crime}{The number of police-recorded low-level crimes per 1,000 people, with
#'                          bicycle theft and shoplifting used as indicators of overall rates.}
#'   \item{mental_health_conditions}{The percentage of people reporting a mental health condition,
#'                                   such as depression or anxiety- not based on GP records but
#'                                   survey responses.}
#'   \item{overweight_and_obesity_in_adults}{The percentage of adults (18+) who are overweight or
#'                                           obese, based on self-reported height and weight in a survey.}
#'   \item{overweight_and_obesity_in_children}{The percentage of children in Reception (aged 4-5)
#'                                             and Year 6 (aged 10-11) who are overweight or obese.}
#'   \item{physical_activity}{The percentage of adults (19+) reporting physical activity of 150 minutes
#'                            or more per week.}
#'   \item{rough_sleeping}{The number of people sleeping outdoors on a single night in October or November,
#'                         per 100,000 residents.}
#'   \item{smoking}{The percentage of adults (18+) who currently smoke cigarettes.}
#'   \item{unemployment}{The percentage of adults (16+) actively seeking work in the past four
#'                       weeks and available to start within two weeks, relative to the economically
#'                       active population.}
#'   \item{young_ppl_edu_empl_appren}{The percentage of 16 and 17-year-olds in sustained education,
#'                                    employment, or apprenticeships one year after key stage 4 (after
#'                                    school Year 11).}
#' }
#'
#' @source Office for National Statistics (ONS), released 16 June 2023, ONS website, Health Index Scores, England,
#' Url: \url{https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/datasets/healthindexscoresengland}.
"hie_2021"

# ------------------------------------------------------------------------------

#' Alcohol consumption around the world (2000-2019)
#'
#' A dataset which contains information about alcohol consumption across various countries.
#'
#' @format A data frame with 936 rows and 4 variables:
#' \describe{
#'   \item{country}{Country of origin of participant}
#'   \item{code}{Country code related to the country-of-origin of participant}
#'   \item{year}{The year in which data was collected}
#'   \item{consumption}{Indicates the liters of pure alcohol consumed by
#'                      individuals of 15+ years of age in the previous year.}
#' }
#'
#' @source Multiple sources compiled by World Bank (2024) – processed by Our World in Data.
#' “Total alcohol consumption per capita – In liters of pure alcohol, projected estimates,
#' 15+ years of age”, Url: \url{https://ourworldindata.org/alcohol-consumption}. World Health Organization (via World Bank),
#' “World Development Indicators”, Url: \url{https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators}.
"alcohol"

# ------------------------------------------------------------------------------

#' Alcohol consumption around the world (2019)
#'
#' A dataset which contains information about alcohol consumption across various countries.
#'
#' @format A data frame with 188 rows and 4 variables:
#' \describe{
#'   \item{country}{Country of origin of participant}
#'   \item{code}{Country code related to the country-of-origin of participant}
#'   \item{year}{The year in which data was collected}
#'   \item{consumption}{Indicates the liters of pure alcohol consumed by
#'                      individuals of 15+ years of age in the previous year.}
#' }
#'
#' @source Multiple sources compiled by World Bank (2024) – processed by Our World in Data.
#' “Total alcohol consumption per capita – In liters of pure alcohol, projected estimates,
#' 15+ years of age”, Url: \url{https://ourworldindata.org/alcohol-consumption}. World Health Organization (via World Bank),
#' “World Development Indicators”, Url: \url{https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators}.
"alcohol_2019"

# ------------------------------------------------------------------------------

#' The Health Index for England (2015 and 2021)
#'
#' A selected range of variables from the the Health Index for England dataset, which is
#' a comprehensive measure of national health, considering outcomes, behaviors, personal
#' circumstances, and environmental factors. It provides a single health score and allows
#' detailed breakdowns by location and topic, facilitating comparisons over time. This
#' dataset only contains data collected in 2015 and 2021.
#'
#' @format A data frame with 614 rows and 6 variables:
#' \describe{
#'   \item{area_name}{The area the data was collected from.}
#'   \item{year}{The year data was collected.}

#'   \item{feelings_of_anxiety}{The average anxiety score of respondents (16+) when asked
#'                              how they felt the day before.}
#'   \item{happiness}{The average happiness score of respondents (16+) when asked
#'                              how they felt the day before.}
#'   \item{healthy_eating}{The percentage of adults (16+) who report eating five or more
#'                          portions of fruit and vegetables on a 'usual day'.}
#'   \item{life_satisfaction}{The average life satisfaction score of respondents aged 16 and over.}
#' }
#'
#' @source Office for National Statistics (ONS), released 16 June 2023, ONS website, Health Index Scores, England,
#' Url: \url{https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/datasets/healthindexscoresengland}.
"hie_15_21"

# ------------------------------------------------------------------------------

#' Student Life (Open comments)
#'
#' This dataset contains English comments by students about their study experiences at a fictitious university.
#'
#' @format A data frame with 209 rows and 1 variable:
#' \describe{
#'   \item{comment}{Comments by students about their study experiences.}
#'   \item{social_inclusion}{Provides a score from 1-10 regarding the level of social inclusion
#'                           experienced by students. | 1 ("I feel lonely") to 10 = ("I feel par of the campus community").}
#' }
#'
#' @source Fictitious dataset created for educational purposes.
"comments"

# ------------------------------------------------------------------------------

#' Student Reading Time
#'
#' This dataset contains English comments by students about their study experiences at a fictitious university.
#'
#' @format A data frame with 209 rows and 3 variable:
#' \describe{
#'   \item{gender}{Gender of the participant}
#'   \item{degree_level}{Degree level of participant}
#'   \item{min_reading}{Reading time per week measured in minutes}
#' }
#'
#' @source Fictitious dataset created for educational purposes.
"reading_time"

# ------------------------------------------------------------------------------

#' Salary, Work experience, and Mindfulness (SWM)
#'
#' This dataset contains information about employees' salary, their working experience and time spend
#' on mindfulness practices.
#'
#' @format A data frame with 100 rows and 3 variables:
#' \describe{
#'   \item{salary}{Salary earned (in USD 1000)}
#'   \item{work_experience}{Years of working experience}
#'   \item{mindfulness}{Minutes spent on mindfulness practices in a 5-day working week.}
#' }
#'
#' @source Fictitious dataset created for educational purposes.
"swm"
