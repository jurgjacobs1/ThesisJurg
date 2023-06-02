# Libraries 
library(readr)

#--- Read in data ---#
df <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")

#--- Exploratory research: positive and negative sentiment ---#
model_sentiment <- lm(log(lifetime_duration) ~ log(neg_sentiment) + log(pos_sentiment), df)

summary(model_sentiment)