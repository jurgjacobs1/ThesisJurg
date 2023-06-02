# Libraries
library(readr)
library(ggplot2)
library(psych)
library(dplyr)

#--- Read in the final data frame ---#
df <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")

#--- Summary statistics ---#
summary_stats <- describe(df[-c(1:3)])

summary_stats_br <- df %>% 
  filter(country_name == "Brazil") %>% 
  describe()

summary_stats_fr <- df %>% 
  filter(country_name == "France") %>% 
  describe()

summary_stats_jp <- df %>% 
  filter(country_name == "Japan") %>% 
  describe()

summary_stats_mx <- df %>% 
  filter(country_name == "Mexico") %>% 
  describe()

summary_stats_uk <- df %>% 
  filter(country_name == "United Kingdom") %>% 
  describe()

summary_stats_us <- df %>% 
  filter(country_name == "United States") %>% 
  describe()

#--- Distribution of variables ---#
ggplot(df, aes(lifetime_duration)) +
  geom_density(alpha = .3) +
  theme_classic()

ggplot(df, aes(tweetvol)) +
  geom_density(alpha = .3) +
  theme_classic()

ggplot(df, aes(tweetsent)) +
  geom_density(alpha = .3) +
  theme_classic()

# Plot by country
ggplot(df, aes(lifetime_duration, fill = country_name)) +
  geom_density(alpha = .3) +
  facet_wrap(~ country_name, scales = "free") +
  theme_classic()

ggplot(df, aes(tweetsent, fill = country_name)) +
  geom_density(alpha = .3) +
  facet_wrap(~ country_name, scales = "free") +
  theme_classic()

ggplot(df, aes(tweetvol, fill = country_name)) +
  geom_density(alpha = .3) +
  facet_wrap(~ country_name, scales = "free") +
  theme_classic()

# Use modelsummary() to make a good table from your model results
