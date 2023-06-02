# Libraries
library(readr)
library(tidyverse)
library(modelsummary)

#--- Read in data ---#
df <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")

#--- Running the models ---#
# Model 1
model1 <- lm(log(lifetime_duration) ~ log(tweetvol) + log(tweetsent), df)

summary(model1)

# Model 2
model2 <- lm(log(lifetime_duration) ~ log(tweetvol)*uncertainty_avoidance + log(tweetsent)*uncertainty_avoidance + log(tweetvol)*individualism + log(tweetsent)*individualism, df)

summary(model2)

# Model 3
model3 <- lm(log(lifetime_duration) ~ log(tweetvol)*uncertainty_avoidance + log(tweetsent)*uncertainty_avoidance + log(tweetvol)*individualism + log(tweetsent)*individualism +
               averageRating + sequel + Drama + Horror + Mystery + Action + Adventure + Comedy + Romance + Thriller + Crime + Animation, df)

summary(model3)

#--- Model summary ---#
modelsummary(list(model1, model2, model3))
