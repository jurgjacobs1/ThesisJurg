# Libraries
library(readr)
library(ggplot2)

#--- Read in the data ---#
df <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")

#--- Figures ---#
# Twitter WoM volume and Lifetime duration
## Calculating the mean of Twitter WoM volume against each level of lifetime duration
mean_tweetvol <- aggregate(lifetime_duration ~ tweetvol, data = df, FUN = mean)

## Plot
ggplot(mean_tweetvol, aes(x = log(tweetvol),
               y = log(lifetime_duration))) +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE, color = "red", linetype = "dashed", linewidth = 1) +
  labs(y = "Lifetime Duration (log)", x = "Twitter WoM Volume (log)") + # Labels of the axes
  ggtitle("Lifetime duration by Twitter WoM Volume") +  # Title of the graph
  theme_minimal()  # Use of minimalistic theme

# Uncertainty avoidance and lifetime duration
## Calculating the mean of lifetime duration against each level of uncertainty avoidance
mean_uac <- aggregate(lifetime_duration ~ uncertainty_avoidance, data = df, FUN = mean)

## Plot
ggplot(mean_uac, aes(x = uncertainty_avoidance,
               y = log(lifetime_duration))) +
  geom_line() +
  labs(y = "Lifetime Duration (log)", x = "Level of uncertainty avoidance") + # Labels of the axes
  ggtitle("Lifetime duration by the level of uncertainty avoidance") +  # Title of the graph
  theme_minimal()  # Use of minimalistic theme

# Negative sentiment and Lifetime duration
## Calculating the mean of lifetime duration against each level of negative sentiment
mean_neg <- aggregate(lifetime_duration ~ neg_sentiment, data = df, FUN = mean)

## Plot
ggplot(mean_neg, aes(x = log(neg_sentiment),
                     y = log(lifetime_duration))) +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE, color = "red", linetype = "dashed", linewidth = 1) +
  labs(y = "Lifetime Duration (log)", x = "Negative Twitter WoM sentiment (log)") + # Labels of the axes
  ggtitle("Lifetime duration by Negative Twitter WoM sentiment") +  # Title of the graph
  theme_minimal()  # Use of minimalistic theme
