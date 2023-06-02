# Libraries
library(readr)
library(dplyr)
library(tidyverse)
library(plyr)
library(data.table)

#--- Read in the data for every country ---#
tweetsentiment_br <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/tweetsentiment_br.csv",
                              col_select = c("video_title", "text", "created_at", "negative", "neutral", "positive"))
tweetsentiment_fr <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/tweetsentiment_fr.csv",
                              col_select = c("video_title", "text", "created_at", "negative", "neutral", "positive"))
tweetsentiment_jp <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/tweetsentiment_jp.csv",
                              col_select = c("video_title", "text", "created_at", "negative", "neutral", "positive"))
tweetsentiment_mx <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/tweetsentiment_mx.csv",
                              col_select = c("video_title", "text", "created_at", "negative", "neutral", "positive"))
tweetsentiment_uk <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/tweetsentiment_uk.csv",
                              col_select = c("video_title", "text", "created_at", "negative", "neutral", "positive"))

# Since the sentiment analysis of US tweets is split up in four parts, below the data files are merged to one file.
merge_tweets_country = function(path){
  filenames = list.files(path = path, full.names = TRUE)
  rbindlist(lapply(filenames, fread, fill=TRUE))
}

path_us <- "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/us"
tweetsentiment_us = merge_tweets_country(path_us)
tweetsentiment_us <- tweetsentiment_us[, c(6, 2, 7, 3:5)]

# Looks like there are a lot of duplicates. These are deleted.
tweetsentiment_us <- tweetsentiment_us %>% 
  distinct(video_title, text, .keep_all = TRUE)

# Write csv file to store the data frame on the computer.
write_csv(tweetsentiment_us, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/tweetsentiment_us.csv")

#--- Determine the sentiment for each tweet per country ---#
# Brazil
tweetsentiment_br$sentiment <- ifelse(tweetsentiment_br$negative >= 0.5, "negative", # if negative column is larger than or equal to 0.5, give the column sentiment the score 'negative'
                                      ifelse(tweetsentiment_br$neutral >= 0.5, "neutral", # if neutral column is larger than or equal to 0.5, give the column sentiment the score 'neutral'
                                             ifelse(tweetsentiment_br$positive >= 0.5, "positive", # if neutral column is larger than or equal to 0.5, give the column sentiment the score 'positive'
                                                    "neutral"))) # otherwise, give the sentiment column the value 'neutral'.

# France
tweetsentiment_fr$sentiment <- ifelse(tweetsentiment_fr$negative >= 0.5, "negative", 
                                      ifelse(tweetsentiment_fr$neutral >= 0.5, "neutral", 
                                             ifelse(tweetsentiment_fr$positive >= 0.5, "positive", 
                                                    "neutral")))

# Japan
tweetsentiment_jp$sentiment <- ifelse(tweetsentiment_jp$negative >= 0.5, "negative", 
                                      ifelse(tweetsentiment_jp$neutral >= 0.5, "neutral", 
                                             ifelse(tweetsentiment_jp$positive >= 0.5, "positive", 
                                                    "neutral")))

# Mexico
tweetsentiment_mx$sentiment <- ifelse(tweetsentiment_mx$negative >= 0.5, "negative", 
                                      ifelse(tweetsentiment_mx$neutral >= 0.5, "neutral", 
                                             ifelse(tweetsentiment_mx$positive >= 0.5, "positive", 
                                                    "neutral")))

# United Kingdom
tweetsentiment_uk$sentiment <- ifelse(tweetsentiment_uk$negative >= 0.5, "negative", 
                                      ifelse(tweetsentiment_uk$neutral >= 0.5, "neutral", 
                                             ifelse(tweetsentiment_uk$positive >= 0.5, "positive", 
                                                    "neutral")))

# United States
tweetsentiment_us$sentiment <- ifelse(tweetsentiment_us$negative >= 0.5, "negative", 
                                      ifelse(tweetsentiment_us$neutral >= 0.5, "neutral", 
                                             ifelse(tweetsentiment_us$positive >= 0.5, "positive", 
                                                    "neutral")))

#--- Count the number of classifications per video title ---#
# Brazil
tweetcount_sentiment_br <- ddply(tweetsentiment_br, .(video_title, sentiment), nrow) # counts the number of sentiment classifications of tweets (negative, neutral or positive) by video title and stores it in new data frame.

# Uses data frame from above to summarize the tweets sentiment classification counts by video title.
# If video title has a row in the data frame that has a count on negative/neutral/positive sentiment classification, store that value in column 'neg/neu/pos_sentiment_br', otherwise store value 0.
sentiment_videotitle_br <- tweetcount_sentiment_br %>% 
  group_by(video_title) %>% 
  dplyr::summarise(
    neg_sentiment = ifelse(any(sentiment == "negative"), V1[sentiment == "negative"], 0),
    neu_sentiment = ifelse(any(sentiment == "neutral"), V1[sentiment == "neutral"], 0),
    pos_sentiment = ifelse(any(sentiment == "positive"), V1[sentiment == "positive"], 0)
  )

## Add column with country name
sentiment_videotitle_br <- sentiment_videotitle_br %>% 
  add_column(country_name = "Brazil")

# France
tweetcount_sentiment_fr <- ddply(tweetsentiment_fr, .(video_title, sentiment), nrow)

sentiment_videotitle_fr <- tweetcount_sentiment_fr %>% 
  group_by(video_title) %>% 
  dplyr::summarise(
    neg_sentiment = ifelse(any(sentiment == "negative"), V1[sentiment == "negative"], 0),
    neu_sentiment = ifelse(any(sentiment == "neutral"), V1[sentiment == "neutral"], 0),
    pos_sentiment = ifelse(any(sentiment == "positive"), V1[sentiment == "positive"], 0)
  )

## Add column with country name
sentiment_videotitle_fr <- sentiment_videotitle_fr %>% 
  add_column(country_name = "France")

# Japan
tweetcount_sentiment_jp <- ddply(tweetsentiment_jp, .(video_title, sentiment), nrow)

sentiment_videotitle_jp <- tweetcount_sentiment_jp %>% 
  group_by(video_title) %>% 
  dplyr::summarise(
    neg_sentiment = ifelse(any(sentiment == "negative"), V1[sentiment == "negative"], 0),
    neu_sentiment = ifelse(any(sentiment == "neutral"), V1[sentiment == "neutral"], 0),
    pos_sentiment = ifelse(any(sentiment == "positive"), V1[sentiment == "positive"], 0)
  )

## Add column with country name
sentiment_videotitle_jp <- sentiment_videotitle_jp %>% 
  add_column(country_name = "Japan")

# Mexico
tweetcount_sentiment_mx <- ddply(tweetsentiment_mx, .(video_title, sentiment), nrow)

sentiment_videotitle_mx <- tweetcount_sentiment_mx %>% 
  group_by(video_title) %>% 
  dplyr::summarise(
    neg_sentiment = ifelse(any(sentiment == "negative"), V1[sentiment == "negative"], 0),
    neu_sentiment = ifelse(any(sentiment == "neutral"), V1[sentiment == "neutral"], 0),
    pos_sentiment = ifelse(any(sentiment == "positive"), V1[sentiment == "positive"], 0)
  )

## Add column with country name
sentiment_videotitle_mx <- sentiment_videotitle_mx %>% 
  add_column(country_name = "Mexico")

# United Kingdom
tweetcount_sentiment_uk <- ddply(tweetsentiment_uk, .(video_title, sentiment), nrow)

sentiment_videotitle_uk <- tweetcount_sentiment_uk %>% 
  group_by(video_title) %>% 
  dplyr::summarise(
    neg_sentiment = ifelse(any(sentiment == "negative"), V1[sentiment == "negative"], 0),
    neu_sentiment = ifelse(any(sentiment == "neutral"), V1[sentiment == "neutral"], 0),
    pos_sentiment = ifelse(any(sentiment == "positive"), V1[sentiment == "positive"], 0)
  )

## Add column with country name
sentiment_videotitle_uk <- sentiment_videotitle_uk %>% 
  add_column(country_name = "United Kingdom")

# United States
tweetcount_sentiment_us <- ddply(tweetsentiment_us, .(video_title, sentiment), nrow)

sentiment_videotitle_us <- tweetcount_sentiment_us %>% 
  group_by(video_title) %>% 
  dplyr::summarise(
    neg_sentiment = ifelse(any(sentiment == "negative"), V1[sentiment == "negative"], 0),
    neu_sentiment = ifelse(any(sentiment == "neutral"), V1[sentiment == "neutral"], 0),
    pos_sentiment = ifelse(any(sentiment == "positive"), V1[sentiment == "positive"], 0)
  )

## Add column with country name
sentiment_videotitle_us <- sentiment_videotitle_us %>% 
  add_column(country_name = "United States")

#--- Merge all the tweetsentiment data frames into one data frame ---#
tweetsentiment <- rbind(sentiment_videotitle_br, sentiment_videotitle_fr, sentiment_videotitle_jp, sentiment_videotitle_mx, sentiment_videotitle_uk, sentiment_videotitle_us)

#--- Write csv to download and export tweetsentiment data frame ---#
write_csv(tweetsentiment, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweetsentiment.csv")

#--- Write csv to download and export tweetsentiment by country data frames ---#
data_names <- c("sentiment_videotitle_br", "sentiment_videotitle_fr", "sentiment_videotitle_jp", "sentiment_videotitle_mx", "sentiment_videotitle_uk", "sentiment_videotitle_us")

for(i in 1:length(data_names)) {
  write_csv(get(data_names[i]),
            paste0("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/twitter/tweet_sentiment/",
                   data_names[i],
                   ".csv"))
}
