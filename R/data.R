#' Top 250 movies ranked on IMDb
#'
#' A dataset containing details about the top 250 movies
#' ranked on IMDb.
#'
#' @format A data frame with 250 rows and 16 variables:
#' \describe{
#'   \item{title}{\emph{Movie title}}
#'   \item{rank}{\emph{Overall rank on IMDb}}
#'   \item{year}{\emph{Year the movie was published}}
#'   \item{runtime_min}{\emph{Runtime of the movie in minutes}}
#'   \item{imdb_rating}{\emph{Rating from imdb, ranges from 1-10}}
#'   \item{metascore}{\emph{Metascore which is based on critics' ratings}}
#'   \item{synopsis}{\emph{A short summary of the movie}}
#'   \item{director}{\emph{Director of the movie}}
#'   \item{star_01}{\emph{Actor/actress listed first for this movie}}
#'   \item{star_02}{\emph{Actor/actress listed second for this movie}}
#'   \item{star_03}{\emph{Actor/actress listed third for this movie}}
#'   \item{star_04}{\emph{Actor/actress listed fourth for this movie}}
#'   \item{votes}{\emph{Number of viewer votes for this movie}}
#'   \item{gross_in_m}{\emph{Income generated from this movie in million dollars}}
#'   \item{genre}{\emph{Genres the movie is categorised in}}
#'   \item{genre_01}{\emph{First genre listed for this movie}}
#' }
#' @source IMDb (\url{https://www.imdb.com})
"imdb_top_250"

# ------------------------------------------------------------------------------

#' Top 250 movies ranked on IMDb \emph{(Directors with >2 movies)}
#'
#' A subset of the \emph{imdb_top_250} dataset. It only contains movies of directors
#' who had more than two movies in this data frame Where directors had more than two
#' movies ranked on IMDb Top 250, a random sample of two movies was chosen.
#'
#' @format A data frame with 86 rows and 5 variables:
#' \describe{
#'   \item{director}{\emph{Director of the movie}}
#'   \item{imdb_rating}{\emph{Rating from imdb, ranges from 1-10}}
#'   \item{year}{\emph{Year the movie was published}}
#'   \item{title}{\emph{Movie title}}
#'   \item{movie}{\emph{Grouping ID, i.e. 1 = first movie, 2 = second movie}}
#' }
#' @source IMDb (\url{https://www.imdb.com})
"dir_mov"

# ------------------------------------------------------------------------------

#' World Value Survey \emph{(Extract)}
#'
#' A dataset which contains selected data from the World Value Survey.
#' This data was obtained in October 2020.
#'
#' @format A data frame with 69578 rows and 7 variables:
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
#' @source World Value Survey (\url{https://www.worldvaluessurvey.org})
"wvs"

# ------------------------------------------------------------------------------

#' World Value Survey \emph{(Extract)}
#'
#' A cleaned version of the \emph{wvs} dataset.
#'
#' @format A data frame with 69578 rows and 6 variables:
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
#' @source World Value Survey (\url{https://www.worldvaluessurvey.org})
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
#' @source World Health Organisation datasets: \url{https://covid19.who.int/info/}
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
#' @source Research at the University of Warwick (2018)
"ic_training"

# ------------------------------------------------------------------------------

#' World Value Survey (Waves)
#'
#' A dataset excerpt from the World Value Survey including 4 countries over 7 waves of data
#' collection.
#'
#' @format A data frame with 39,962 rows and 4 variables:
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
#' @source World Value Survey (\url{https://www.worldvaluessurvey.org})
"wvs_waves"
