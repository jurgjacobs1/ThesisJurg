# Libraries
library(readr)
library(dplyr)
library(data.table)
library(plyr)
library(tidyverse)

# Import unique video titles csv file
video_titles <- read_csv("//Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/netflix/video_titles_countries.csv")

#--- Create function that merges all csv files by country into one data frame by country ---#
merge_tweets_country = function(path){
  filenames = list.files(path = path, full.names = TRUE)
  rbindlist(lapply(filenames, fread, fill = TRUE))
}

# Brazil does not need fill = TRUE, otherwise error
merge_tweets_brazil = function(path){
  filenames = list.files(path = path, full.names = TRUE)
  rbindlist(lapply(filenames, fread))
}

#--- Use the function from above to merge the files and retrieve the tweet volume by country ---#
# Brazil
path_brazil <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country_video/brazil"
tweets_brazil = merge_tweets_brazil(path_brazil)

## Count the number of tweets by video title and store it in a new data frame
tweetvolume_br <- ddply(tweets_brazil, .(video_title), nrow)

## Change the column name to tweetvol_br
names(tweetvolume_br)[names(tweetvolume_br) == "V1"] <- "tweetvol"

## Add column with country name
tweetvolume_br <- tweetvolume_br %>% 
  add_column(country_name = "Brazil")

# France
path_france <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country_video/france"
tweets_france = merge_tweets_country(path_france)

## Count the number of tweets by video title and store it in a new data frame
tweetvolume_fr <- ddply(tweets_france, .(video_title), nrow)

## Change the column name to tweetvol_fr
names(tweetvolume_fr)[names(tweetvolume_fr) == "V1"] <- "tweetvol"

## Add column with country name
tweetvolume_fr <- tweetvolume_fr %>% 
  add_column(country_name = "France")

# Japan
path_japan <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country_video/japan"
tweets_japan = merge_tweets_country(path_japan)

## Count the number of tweets by video title and store it in a new data frame
tweetvolume_jp <- ddply(tweets_japan, .(video_title), nrow)

## Change the column name to tweetvol_jp
names(tweetvolume_jp)[names(tweetvolume_jp) == "V1"] <- "tweetvol"

## Add column with country name
tweetvolume_jp <- tweetvolume_jp %>% 
  add_column(country_name = "Japan")

# Mexico
path_mexico <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country_video/mexico"
tweets_mexico = merge_tweets_country(path_mexico)

## Count the number of tweets by video title and store it in a new data frame
tweetvolume_mx <- ddply(tweets_mexico, .(video_title), nrow)

## Change the column name to tweetvol_mx
names(tweetvolume_mx)[names(tweetvolume_mx) == "V1"] <- "tweetvol"

## Add column with country name
tweetvolume_mx <- tweetvolume_mx %>% 
  add_column(country_name = "Mexico")

# United Kingdom
path_uk <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country_video/united_kingdom"
tweets_uk = merge_tweets_country(path_uk)

## Count the number of tweets by video title and store it in a new data frame
tweetvolume_uk <- ddply(tweets_uk, .(video_title), nrow)

## Change the column name to tweetvol_uk
names(tweetvolume_uk)[names(tweetvolume_uk) == "V1"] <- "tweetvol"

## Add column with country name
tweetvolume_uk <- tweetvolume_uk %>% 
  add_column(country_name = "United Kingdom")

# United States
path_us <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country_video/united_states"
tweets_us = merge_tweets_country(path_us)

## Count the number of tweets by video title and store it in a new data frame
tweetvolume_us <- ddply(tweets_us, .(video_title), nrow)

## Change the column name to tweetvol_us
names(tweetvolume_us)[names(tweetvolume_us) == "V1"] <- "tweetvol"

## Add column with country name
tweetvolume_us <- tweetvolume_us %>% 
  add_column(country_name = "United States")

#--- Merge all the tweetvolume data frames into one data frame ---#
tweetvolume <- rbind(tweetvolume_br, tweetvolume_fr, tweetvolume_jp, tweetvolume_mx, tweetvolume_uk, tweetvolume_us)

#--- Write csv file to export the tweet volume ---#
write_csv(tweetvolume, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweetvolume.csv")

#--- Write csv files to export tweet volume by video title and country ---#
dir.create("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_volume")

data_names <- c("tweetvolume_br", "tweetvolume_fr", "tweetvolume_jp", "tweetvolume_mx", "tweetvolume_uk", "tweetvolume_us")

for(i in 1:length(data_names)) {
  write_csv(get(data_names[i]),
            paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_volume/",
                   data_names[i],
                   ".csv"))
}

#--- Write csv files to export all tweets by country ---#
dir.create("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country")

data_countries <- c("tweets_brazil", "tweets_france", "tweets_japan", "tweets_mexico", "tweets_uk", "tweets_us") 

for(i in 1:length(data_countries)) {
  write_csv(get(data_countries[i]),
            paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweets_country/",
                   data_countries[i],
                   ".csv"))
}
