source("WHR_Data_Cleaning.R")


for (i in 1:length(full_report)) {
  if (is.list(full_report[[i]]$Region)) {
    full_report[[i]]$Region <- unlist(full_report[[i]]$Region)
  }
}

for (i in 1:length(full_report)) {
  if (is.double(full_report[[i]]$"Perceptions of corruption")) {
    full_report[[i]]$"Perceptions of corruption" <- as.character(full_report[[i]]$"Perceptions of corruption")
  }
}

full_df <- bind_rows(full_report)

# bar chart for happiness scores by region
ggplot(full_df, aes(x = Region, y = Happiness.Score, fill = Region)) +
  geom_col(alpha=0.5) +
  labs(title = "Happiness Scores by Region",
       x = "Region",
       y = "Happiness Score")

# density curve by region
ggplot(full_df, aes(x = Happiness.Score, color = Region)) +
  geom_density(alpha=0.5) +
  labs(title = "Density Curve of Happiness Scores by Region",
       x = "Happiness Score",
       y = "Density")