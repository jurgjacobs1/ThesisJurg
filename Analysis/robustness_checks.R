# Libraries
library(readr)
library(tidyverse)
library(olsrr)

#--- Read in data ---#
df <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")

#--- Define the model ---#
model <- lm(log(lifetime_duration) ~ log(tweetvol)*uncertainty_avoidance + log(tweetsent)*uncertainty_avoidance + log(tweetvol)*individualism + log(tweetsent)*individualism +
               averageRating + sequel + Drama + Horror + Mystery + Action + Adventure + Comedy + Romance + Thriller + Crime + Animation, df)

#--- Robustness check: influential observations ---#
# Outliers
cooksd <- cooks.distance(model)
plot(cooksd, cex = 1, main = "Influential Observations by Cook's Distance")
abline(h = 4/length(cooksd), col = "red")

## Determine the observations that are above the threshold
n <- length(cooksd)
threshold_cooksd <- 4/n
influential_observations <- which(cooksd > threshold_cooksd)

# Leverage points
ols_plot_resid_lev(model)

influence <- influence.measures(model)
leverage <- influence$infmat[, "hat"]

## Determine the observations that are above the threshold
threshold_leverage <- 2*(18/1005) # 18 predictor variables (including the intercept) and 1005 observations.

leverage_points <- which(leverage > threshold_leverage)

# Both influential and leverage
both <- intersect(influential_observations, leverage_points)

df_without_both <- df[-both, ]
model_without_both <- lm(log(lifetime_duration) ~ log(tweetvol)*uncertainty_avoidance + log(tweetsent)*uncertainty_avoidance + log(tweetvol)*individualism + log(tweetsent)*individualism +
                                       averageRating + sequel + Drama + Horror + Mystery + Action + Adventure + Comedy + Romance + Thriller + Crime + Animation, df_without_both)

summary(model_without_both)

#--- Robustness check: Category as independent variable ---#
model_category <- lm(log(lifetime_duration) ~ log(tweetvol)*uncertainty_avoidance + log(tweetsent)*uncertainty_avoidance + log(tweetvol)*individualism + log(tweetsent)*individualism +
                       averageRating + sequel + Drama + Horror + Mystery + Action + Adventure + Comedy + Romance + Thriller + Crime + Animation + category, df)

summary(model_category)
