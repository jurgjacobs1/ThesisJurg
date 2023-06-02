# Libraries
library(academictwitteR)
library(readr)
library(dplyr)
library(purrr)

# Read in unique video titles
video_titles <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/video_titles_countries.csv")

# Copies the show title and puts it in a new column.
video_titles <-
  video_titles %>% 
  mutate(query = show_title)

# Remove the spaces and special characters and puts a # in front of the show title.
video_titles$query <- gsub(" ", "", video_titles$query)
video_titles$query <- gsub("[[:punct:]]", "", video_titles$query)
video_titles$query <- paste0('#', video_titles$query)

# Creates a column that represents the video title. Later on, this is used in the CSV files.
video_titles <-
  video_titles %>% 
  mutate(file_name_video = video_title)

video_titles$file_name_video <- gsub(" ", "", video_titles$file_name_video)
video_titles$file_name_video <- gsub("[[:punct:]]", "", video_titles$file_name_video)

# Complete the search query for every country
video_titles <-
  video_titles %>% 
  mutate(query_brazil = 
           paste0(query, " place_country:br")
         ) %>% 
  mutate(query_france =
           paste0(query, " place_country:fr")
         ) %>% 
  mutate(query_japan =
           paste0(query, " place_country:jp")
         ) %>% 
  mutate(query_mexico =
           paste0(query, " place_country:mx")
         ) %>% 
  mutate(query_united_kingdom =
           paste0(query, " place_country:gb")
         ) %>% 
  mutate(query_united_states =
           paste0(query, " place_country:us")
         )

# Bearer token - Twitter API
bearer_token <- "BEARER TOKEN HERE"

# Create folders to store the data in
dir.create("tweets_country_video/brazil")
dir.create("tweets_country_video/france")
dir.create("tweets_country_video/japan")
dir.create("tweets_country_video/mexico")
dir.create("tweets_country_video/united_kingdom")
dir.create("tweets_country_video/united_states")

# Using the Twitter API to gather all the tweets by country
## Brazil
for (i in 1:nrow(video_titles)) { # this loop iterates over all the unique video titles
  if (video_titles$Brazil[i] == 1) { # checks whether the video title was in the Netflix top 10 for Brazil
    
    query <- video_titles$query_brazil[i] # stores the search query of brazil into the value 'query'
    # searches for all tweets that match the query in the period from 2021-07-04 until 2022-07-10 
    tweets <- get_all_tweets(query,
                             "2021-07-04T00:00:00Z", # start time for searching tweets
                             "2022-07-10T00:00:00Z", # end time for searching tweets
                             n = 5000, # maximum number of tweets per video title
                             bearer_token) # refers to the bearer token above.
    
    # if there are no tweets regarding the query, then the loop goes on to the next row
    if (length(tweets) == 0) {
      next
    }
    
    tweets_df <- tweets %>% select("text", "created_at") # only select the columns text and created_at, other columns are unnecessary
    tweets_df <- cbind(video_title = video_titles$video_title[i], tweets_df) # creates a new column with the video title as a value for every row
    
    file_name_video <- paste0("tweets_", video_titles$file_name_video[i], ".csv") # creates a file name of the video based on the file_name_video column
    file_path <- paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/brazil/", file_name_video) # creates a file path where the file must be stored with the right file name
    write_csv(tweets_df, file_path) # writes a csv of the data frame and stores it in the file path
    
    Sys.sleep(3) # loop rest for 3 seconds between the tasks for every unique video title
    
  } else { # if the video title was not in the Netflix top ten, go to the next row.
    next
  }
}

## France
for (i in 1:nrow(video_titles)) { # this loop iterates over all the unique video titles
  if (video_titles$France[i] == 1) { # checks whether the video title was in the Netflix top 10 for France
    
    query <- video_titles$query_france[i] # stores the search query of france into the value 'query'
    # searches for all tweets that match the query in the period from 2021-07-04 until 2022-07-10 
    tweets <- get_all_tweets(query,
                             "2021-07-04T00:00:00Z", # start time for searching tweets
                             "2022-07-10T00:00:00Z", # end time for searching tweets
                             n = 5000, # maximum number of tweets per video title
                             bearer_token) # refers to the bearer token above.
    
    # if there are no tweets regarding the query, then the loop goes on to the next row
    if (length(tweets) == 0) {
      next
    }
    
    tweets_df <- tweets %>% select("text", "created_at") # only select the columns text and created_at, other columns are unnecessary
    tweets_df <- cbind(video_title = video_titles$video_title[i], tweets_df) # creates a new column with the video title as a value for every row
    
    file_name_video <- paste0("tweets_", video_titles$file_name_video[i], ".csv") # creates a file name of the video based on the file_name_video column
    file_path <- paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/france/", file_name_video) # creates a file path where the file must be stored with the right file name
    write_csv(tweets_df, file_path) # writes a csv of the data frame and stores it in the file path
    
    Sys.sleep(3) # loop rest for 3 seconds between the tasks for every unique video title
    
  } else { # if the video title was not in the Netflix top ten, go to the next row.
    next
  }
}

## Japan
for (i in 1:nrow(video_titles)) { # this loop iterates over all the unique video titles
  if (video_titles$Japan[i] == 1) { # checks whether the video title was in the Netflix top 10 for Japan
    
    query <- video_titles$query_japan[i] # stores the search query of japan into the value 'query'
    # searches for all tweets that match the query in the period from 2021-07-04 until 2022-07-10 
    tweets <- get_all_tweets(query,
                             "2021-07-04T00:00:00Z", # start time for searching tweets
                             "2022-07-10T00:00:00Z", # end time for searching tweets
                             n = 5000, # maximum number of tweets per video title
                             bearer_token) # refers to the bearer token above.
    
    # if there are no tweets regarding the query, then the loop goes on to the next row
    if (length(tweets) == 0) {
      next
    }
    
    tweets_df <- tweets %>% select("text", "created_at") # only select the columns text and created_at, other columns are unnecessary
    tweets_df <- cbind(video_title = video_titles$video_title[i], tweets_df) # creates a new column with the video title as a value for every row
    
    
    file_name_video <- paste0("tweets_", video_titles$file_name_video[i], ".csv") # creates a file name of the video based on the file_name_video column
    file_path <- paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/japan/", file_name_video) # creates a file path where the file must be stored with the right file name
    write_csv(tweets_df, file_path) # writes a csv of the data frame and stores it in the file path
    
    Sys.sleep(3) # loop rest for 3 seconds between the tasks for every unique video title
    
  } else { # if the video title was not in the Netflix top ten, go to the next row.
    next
  }
}

## Mexico
for (i in 1:nrow(video_titles)) { # this loop iterates over all the unique video titles
  if (video_titles$Mexico[i] == 1) { # checks whether the video title was in the Netflix top 10 for Mexico
    
    query <- video_titles$query_mexico[i] # stores the search query of mexico into the value 'query'
    # searches for all tweets that match the query in the period from 2021-07-04 until 2022-07-10 
    tweets <- get_all_tweets(query,
                             "2021-07-04T00:00:00Z", # start time for searching tweets
                             "2022-07-10T00:00:00Z", # end time for searching tweets
                             n = 5000, # maximum number of tweets per video title
                             bearer_token) # refers to the bearer token above.
    
    # if there are no tweets regarding the query, then the loop goes on to the next row
    if (length(tweets) == 0) {
      next
    }
    
    tweets_df <- tweets %>% select("text", "created_at") # only select the columns text and created_at, other columns are unnecessary
    tweets_df <- cbind(video_title = video_titles$video_title[i], tweets_df) # creates a new column with the video title as a value for every row
    
    file_name_video <- paste0("tweets_", video_titles$file_name_video[i], ".csv") # creates a file name of the video based on the file_name_video column
    file_path <- paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/mexico/", file_name_video) # creates a file path where the file must be stored with the right file name
    write_csv(tweets_df, file_path) # writes a csv of the data frame and stores it in the file path
    
    Sys.sleep(3) # loop rest for 3 seconds between the tasks for every unique video title
    
  } else { # if the video title was not in the Netflix top ten, go to the next row.
    next
  }
}

## United Kingdom
for (i in 1:nrow(video_titles)) { # this loop iterates over all the unique video titles
  if (video_titles$United_Kingdom[i] == 1) { # checks whether the video title was in the Netflix top 10 for United Kingdom
    
    query <- video_titles$query_united_kingdom[i] # stores the search query of united kingdom into the value 'query'
    # searches for all tweets that match the query in the period from 2021-07-04 until 2022-07-10 
    tweets <- get_all_tweets(query,
                             "2021-07-04T00:00:00Z", # start time for searching tweets
                             "2022-07-10T00:00:00Z", # end time for searching tweets
                             n = 5000, # maximum number of tweets per video title
                             bearer_token) # refers to the bearer token above.
    
    # if there are no tweets regarding the query, then the loop goes on to the next row
    if (length(tweets) == 0) {
      next
    }
    
    tweets_df <- tweets %>% select("text", "created_at") # only select the columns text and created_at, other columns are unnecessary
    tweets_df <- cbind(video_title = video_titles$video_title[i], tweets_df) # creates a new column with the video title as a value for every row
    
    file_name_video <- paste0("tweets_", video_titles$file_name_video[i], ".csv") # creates a file name of the video based on the file_name_video column
    file_path <- paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/united_kingdom/", file_name_video) # creates a file path where the file must be stored with the right file name
    write_csv(tweets_df, file_path) # writes a csv of the data frame and stores it in the file path
    
    Sys.sleep(3) # loop rest for 3 seconds between the tasks for every unique video title
    
  } else { # if the video title was not in the Netflix top ten, go to the next row.
    next
  }
}

## United States
for (i in 1:nrow(video_titles)) { # this loop iterates over all the unique video titles
  if (video_titles$United_States[i] == 1) { # checks whether the video title was in the Netflix top 10 for United States
    
    query <- video_titles$query_united_states[i] # stores the search query of united states into the value 'query'
    # searches for all tweets that match the query in the period from 2021-07-04 until 2022-07-10 
    tweets <- get_all_tweets(query,
                             "2021-07-04T00:00:00Z", # start time for searching tweets
                             "2022-07-10T00:00:00Z", # end time for searching tweets
                             n = 5000, # maximum number of tweets per video title
                             bearer_token) # refers to the bearer token above.
    
    # if there are no tweets regarding the query, then the loop goes on to the next row
    if (length(tweets) == 0) {
      next
    }
    
    tweets_df <- tweets %>% select("text", "created_at") # only select the columns text and created_at, other columns are unnecessary
    tweets_df <- cbind(video_title = video_titles$video_title[i], tweets_df) # creates a new column with the video title as a value for every row
    
    file_name_video <- paste0("tweets_", video_titles$file_name_video[i], ".csv") # creates a file name of the video based on the file_name_video column
    file_path <- paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/united_states/", file_name_video) # creates a file path where the file must be stored with the right file name
    write_csv(tweets_df, file_path) # writes a csv of the data frame and stores it in the file path
    
    Sys.sleep(3) # loop rest for 3 seconds between the tasks for every unique video title
    
  } else { # if the video title was not in the Netflix top ten, go to the next row.
    next
  }
}



