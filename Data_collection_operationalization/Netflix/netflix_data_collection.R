# Libraries
library(openxlsx)
library(dplyr)
library(tidyverse)
library(reshape2)
library(tidyr)

#--- Load in Netflix data ---#
df = read.xlsx("https://top10.netflix.com/data/all-weeks-countries.xlsx", sheet = 1)

#--- Filter on countries and time period in the sample ---#
df_sample <- df %>% filter(
  country_name == "Brazil" |
    country_name == "United States" |
    country_name == "United Kingdom" |
    country_name == "France" |
    country_name == "Mexico" |
    country_name == "Japan",
  week <= '2022-07-03'
)

#--- Mutate video_title as the general title of the video ---#
df_sample <- 
  df_sample %>% mutate(
    video_title = case_when(
      category == "Films" ~ show_title,
      category == "TV" ~ season_title
    ),
    df_sample %>% mutate(
      video_title = case_when(
        video_title == "N/A" ~ show_title,
        video_title != "N/A" ~ video_title
      ))
  )

#--- Removing week and country_iso2 column ---#
df_sample <- 
  subset(df_sample, select = -c(2,3))

#--- Determines the maximum lifetime duration of a video title by country ---#
df_lifetime_wide <-
  df_sample %>% 
  group_by(video_title, country_name) %>%
  mutate(
    lifetime_duration_brazil = case_when(
      country_name == "Brazil" ~ max(cumulative_weeks_in_top_10),
      country_name != "Brazil" ~ 0
    )
  ) %>% 
  mutate(
    lifetime_duration_france = case_when(
      country_name == "France" ~ max(cumulative_weeks_in_top_10),
      country_name != "France" ~ 0
    )
  ) %>% 
  mutate(
    lifetime_duration_japan = case_when(
      country_name == "Japan" ~ max(cumulative_weeks_in_top_10),
      country_name != "Japan" ~ 0
    )
  ) %>% 
  mutate(
    lifetime_duration_mexico = case_when(
      country_name == "Mexico" ~ max(cumulative_weeks_in_top_10),
      country_name != "Mexico" ~ 0
    )
  ) %>% 
  mutate(
    lifetime_duration_uk = case_when(
      country_name == "United Kingdom" ~ max(cumulative_weeks_in_top_10),
      country_name != "United Kingdom" ~ 0
    ) 
  ) %>% 
  mutate(
    lifetime_duration_usa = case_when(
      country_name == "United States" ~ max(cumulative_weeks_in_top_10),
      country_name != "United States" ~ 0
    )
  )

#--- Reshape the lifetime duration per country into one column ---#
df_lifetime_long <- df_lifetime_wide %>% 
  gather(key = "country",
         value = "lifetime_duration",
         lifetime_duration_brazil:lifetime_duration_usa)

df_lifetime_long <- df_lifetime_long %>% 
  group_by(video_title, country_name) %>% 
  mutate(lifetime_duration = max(lifetime_duration)) %>% 
  distinct(video_title, country_name, category, lifetime_duration, show_title, season_title)

#--- Determines the highest rank (so minimum) of a video title by country ---#
df_rank_wide <-
  df_sample %>% 
  group_by(video_title, country_name) %>% 
  mutate(
    rank_brazil = case_when(
      country_name == "Brazil" ~ min(weekly_rank),
      country_name != "Brazil" ~ 0
    )
  ) %>% 
  mutate(
    rank_france = case_when(
      country_name == "France" ~ min(weekly_rank),
      country_name != "France" ~ 0
    )
  ) %>% 
  mutate(
    rank_japan = case_when(
      country_name == "Japan" ~ min(weekly_rank),
      country_name != "Japan" ~ 0
    )
  ) %>% 
  mutate(
    rank_mexico = case_when(
      country_name == "Mexico" ~ min(weekly_rank),
      country_name != "Mexico" ~ 0
    )
  ) %>% 
  mutate(
    rank_uk = case_when(
      country_name == "United Kingdom" ~ min(weekly_rank),
      country_name != "United Kingdom" ~ 0
    ) 
  ) %>% 
  mutate(
    rank_us = case_when(
      country_name == "United States" ~ min(weekly_rank),
      country_name != "United States" ~ 0
    )
  )

#--- Reshape the lifetime duration per country into one column ---#
df_rank_long <- df_rank_wide %>% 
  gather(key = "country",
         value = "rank",
         rank_brazil:rank_us)

df_rank_long <- df_rank_long %>% 
  group_by(video_title, country_name) %>% 
  mutate(highest_rank = max(rank)) %>% 
  distinct(video_title, country_name, highest_rank)

#--- Merge the highest rank variable into the data frame ---#
df_total <- merge(df_lifetime_long, df_rank_long, by = c("video_title", "country_name"))

#--- Reshape data frames to write csv for other data collection ---#
# Removes duplicates, such that every, unique video title is one row.
# Makes a data frame in which every country has a dummy column on whether or not the unique video title was present in the top 10.
df_present_top10 <-
  df_sample[c(6,3,4,2,1)] %>% # selects columns and reorders them as well. 
  group_by(video_title, country_name) %>% 
  distinct(video_title, .keep_all = TRUE) %>% # removes duplicates based on the video title.
  mutate(present_top10 = 1) %>% # when the video title was in the top 10 for a given country, this value equals 1.
  pivot_wider(names_from = country_name, values_from = present_top10, values_fill = 0) %>% # takes the names from the column country_name and fills it with whether it was in the top 10 or not (0,1)
  rename(United_Kingdom = `United Kingdom`, # replaces the space with an underscore.
         United_States = `United States`)

# Creates data frame and writes csv for all unique video titles
unique_video_titles <- df_present_top10[c(1:4)]

write_csv(unique_video_titles, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/unique_video_titles.csv")

# Creates data frame and writes csv for all video titles with corresponding top 10 countries
video_titles_countries <- df_present_top10

write_csv(video_titles_countries, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/video_titles_countries.csv")

#--- Writes the final dataset ---#
# Drops the columns show_title & season_title and writes csv to export this data frame
netflix <- df_total[c(1, 4, 5, 3, 2, 6, 7)]

write_csv(netflix, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/netflix.csv")

