# Libraries
library(readr)
library(dplyr)
library(tidyr)

#--- Import the collected data from various sources ---#
# Netflix
netflix <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/netflix.csv")

# Hofstede
hofstede <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/hofstede/hofstede.csv")

# IMDb
imdb <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/imdb/imdb.csv")

# Twitter
## Twitter volume by video title and country
tweetvolume <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweetvolume.csv")

## Twitter sentiment by video title and country
tweetsentiment <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweetsentiment.csv")

#--- Merging Netflix and Hofstede data ---#
merged_df <- merge(netflix, hofstede, by.x = "country_name", by.y = "country")

# Change the order of the columns
merged_df <- merged_df[c(2:6, 1, 8, 9, 7)]
merged_df <- merged_df[order(merged_df$video_title),]

#--- Merging the IMDb data into the data frame ---#
# This is done based on the video_title and category
merged_df <- merged_df %>% 
  left_join(imdb, by = c("video_title", "category"))

## There are too many genres (25) in the data frame. Let's look at the most popular genres in our video titles list.
genre_list <- merged_df %>%
  subset(select = c(13:37)) %>% 
  sapply(table)
View(genre_list)

## Only the genres with more than 100 video titles are kept. The rest of the columns is deleted. In addition the NumVotes column is deleted.
cols_to_drop = c("numVotes", "Biography", "History", "Fantasy", "Documentary", "Sport", "War", "Reality.TV", "Family", "Sci.Fi", "Music", 
                 "Game.Show", "Musical", "Short", "Western", "Adult", "X.N", "News", "Talk.Show", "Film.Noir")

merged_df <- merged_df[, !names(merged_df) %in% cols_to_drop]

#--- Merging the Twitter data into the merged data frame ---# 
#This is done based on the video_title and country name

## First, the twitter volume. NA is replaced by 0.
merged_df <- merged_df %>% 
  left_join(tweetvolume, by = c("video_title", "country_name"))

## Second, the twitter sentiment. 
merged_df <- merged_df %>% 
  left_join(tweetsentiment, by = c("video_title", "country_name"))

#--- Calculate the positive-negative ratio for the tweet sentiment ---#
merged_df <-
  merged_df %>% 
  mutate(tweetsent = pos_sentiment/neg_sentiment)

# This leads to NA's, NaN, and Inf since a lot of videos have no positive or negative tweets and you can not divide a value by zero. Therefore we filter out these rows. 
merged_df_filtered <- 
  merged_df %>% 
  filter(tweetsent > 0 & tweetsent != Inf)

# This leads to shrinking the size of the data set from 2659 to 1012 rows.

#--- Reorder the columns and delete rows with NA ---#
col_order = c(1, 4, 6, 5, 22, 26, 7, 8, 23:25, 10:21, 9)

final_df <- merged_df_filtered[, col_order]

final_df <- na.omit(final_df) # these NA's come from the IMDb dataset, 7 in total. Leaves us with 1005 rows.

#--- Write csv to export file ---#
write_csv(final_df, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")
