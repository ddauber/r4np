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

#' Top 250 movies ranked on IMDb \emph{(Directors with >2 movies)}
#'
#' A subset of the \emph{imdb_top_250} dataset. It only contains movies of directors
#' who had more than two movies in this data frame Where directors had more than two
#' movies ranked on IMDb Top 250, a random sample of two movies was chosen.
#'
#' @format A data frame with 250 rows and 16 variables:
#' \describe{
#'   \item{director}{\emph{Director of the movie}}
#'   \item{imdb_rating}{\emph{Rating from imdb, ranges from 1-10}}
#'   \item{year}{\emph{Year the movie was published}}
#'   \item{title}{\emph{Movie title}}
#'   \item{movie}{\emph{Grouping ID, i.e. 1 = first movie, 2 = second movie}}
#' }
#' @source IMDb (\url{https://www.imdb.com})
"dir_mov"

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

#' Global Education Profiler \emph{(random sample)}
#'
#' A dataset containing information about students' \emph{social integration (si)} experience at
#' their Higher Education Institutions and their \emph{communication skills (cs)} development.
#' For \emph{cs}, scores of 'actualy experience' and 'importance to me' are available. This
#' dataset only contains a random sample of 300 observations out of well over 12,000 students
#' as of August 2021.
#'
#' @format A data frame with 300 rows and 15 variables:
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

#' COVID-19 DATA: \emph{(Country level data as of 27 August 2021)}
#'
#' A dataset which contains COVID cases and deaths, vaccination information and public
#' health social measures (PHSM) for each country covered by the WHO.
#'
#' @format A data frame with 300 rows and 3 variables:
#' \describe{
#'   \item{date_reported}{Date when cases, deaths, PHSM, etc. were reported}
#'   \item{country_code}{Two-digit country code}
#'   \item{country}{Name of country}
#'   \item{who_region}{WHO region}
#'   \item{new_cases}{# of new COVID cases}
#'   \item{cumulative_cases}{Total number of COVID cases}
#'   \item{new_deaths}{# of new deaths due to COVID}
#'   \item{cumulative_deaths}{Total number of deaths due to COVID}
#'   \item{iso3}{ISO three-digit country identifier}
#'   \item{data_source}{Source of data}
#'   \item{date_updated}{Date when data was last updated}
#'   \item{total_vaccinations}{Total number of vaccinations administered}
#'   \item{vaccinated_1plus_dose}{Total number of people with one or more vaccinations}
#'   \item{total_vaccinations_per100}{Total number of vaccinations administered per 100 population}
#'   \item{vaccinated_1plus_dose_per100}{Total number of people with one or more vaccinations per 100 population}
#'   \item{fully_vaccinated}{Total number of fully vaccinated people}
#'   \item{fully_vaccinated_per100}{Total number of fully vaccinated people per 100 population}
#'   \item{vaccines_used}{Short name of vaccine used}
#'   \item{first_vaccine_date}{Date of first vaccine}
#'   \item{number_vaccines_types_used}{# of different types of vaccines adminstered}
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
