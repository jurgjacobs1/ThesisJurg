# Libraries
library(readr)
library(modelsummary)
library(lmtest)
library(car)
library(corrplot)

#--- Load the data ---#
df <- read_csv("/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/merge/final_df.csv")

#--- Specify the model ---#
model <- lm(log(lifetime_duration) ~ log(tweetvol)*individualism + log(tweetvol)*uncertainty_avoidance + log(tweetsent)*individualism + log(tweetsent)*uncertainty_avoidance +
                  averageRating + sequel + Drama + Horror + Mystery + Action + Adventure + Comedy + Romance + Thriller + Crime + Animation, df)

#--- Normality asssumption ---#
# Q-Q plot
plot(model, 2)

# Histogram
model_residuals <- model$residuals
hist(model_residuals)

#--- Linearity assumption ---#
plot(model, 1)

#--- Homoscedasticity ---# 
gqtest(model)

#--- Multicollinearity ---#
vif(model)

# Create a dataframe with only the variables that will be in the model, otherwise error while computing correlation matrix.
df_cor <- df[-c(1:3, 9:11, 24)]

# Correlation matrix
corrplot(cor(df_cor))
