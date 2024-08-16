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
#'   \item{si_socialise_with_people_exp}{\emph{Extent to which participants have opportunities to socialise with people from diverse cultural backgrounds}}
#'   \item{si_supportive_friends_exp}{\emph{Extent to which participants have supportive friends with a diverse cultural background}}
#'   \item{si_time_socialising_exp}{\emph{Extent to which participants take time to socialise with people from diverse cultural backgrounds}}
#'   \item{cs_explain_ideas_imp}{\emph{Extent to which participants perceive improving in explaining ideas to others (importance)}}
#'   \item{cs_find_clarification_imp}{\emph{Extent to which participants are able to clarify what others mean (importance)}}
#'   \item{cs_learn_different_styles_imp}{\emph{Extent to which participants learn about other students communication styles (importance)}}
#'   \item{cs_explain_ideas_exp}{\emph{Extent to which participants perceive improving in explaining ideas to others (experience)}}
#'   \item{cs_find_clarification_exp}{\emph{Extent to which participants are able to clarify what others mean (experience)}}
#'   \item{cs_learn_different_styles_exp}{\emph{Extent to which participants learn about other students communication styles (experience)}}
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
#' @source Natural England. (2023). people and Nature Survey for England, 2020-2023: Open Access. 3rd Edition. UK Data Service. SN: 9092.
#'         DOI: \url{http://doi.org/10.5255/UKDA-SN-9092-3}
"pplnat"

# ------------------------------------------------------------------------------
