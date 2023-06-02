# Creating a dataframe with the cultural dimensions per country
hofstede <- data.frame(
  country = (c("United States", "Brazil", "United Kingdom", "Mexico", "Japan", "France")),
             individualism = c(91, 38, 89, 30, 46, 71),
             uncertainty_avoidance = c(46, 76, 35, 82, 92, 86))

write.csv(hofstede, "/Users/jurg/Library/Mobile Documents/com~apple~CloudDocs/Master/Master thesis MA/data_collection/hofstede/hofstede.csv", row.names = FALSE)