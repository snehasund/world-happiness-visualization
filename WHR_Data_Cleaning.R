install.packages("tidyverse")
install.packages("ggplot2")
install.packages("readr")

library(tidyverse)
library(ggplot2)
library(readr)

whr2015 <- read_csv("data/2015.csv")
whr2016 <- read_csv("data/2016.csv")
whr2017 <- read_csv("data/2017.csv")
whr2018 <- read_csv("data/2018.csv")
whr2019 <- read_csv("data/2019.csv")

#### ONLY FOR 2017 DATASET #####

# Fill in Region based on data provided in 2015 dataset
regions2017 = list()
for (i in 1:nrow(whr2017)) {
  country = whr2017[i,]["Country"]
  for (j in 1:nrow(whr2015)) {
    if (country == whr2015[j,]["Country"]) {
      regions2017 = c(regions2017, whr2015[j,]["Region"])
      break
    }
  }
  if (!(country %in% whr2015$Country)) {
    regions2017 = c(regions2017, "FILL IN REGION")
  }
}

# Manually fill in the countries whose region was not provided
regions2017[[33]] = "Eastern Asia"
regions2017[[50]] = "Latin America and Caribbean"
regions2017[[71]] = "Eastern Asia"
regions2017[[93]] = "Sub-Saharan Africa"
regions2017[[111]] = "Southern Asia"
regions2017[[147]] = "Sub-Saharan Africa"

# Insert regions dataframe into the main whr2017 dataframe

whr2017$Region = regions2017

#### 2018 DATASET ####

# Fill in Region based on data provided in 2015 dataset
regions2018 = list()
for (i in 1:nrow(whr2018)) {
  country = whr2018[i,]["Country or region"]
  for (j in 1:nrow(whr2015)) {
    if (country == whr2015[j,]["Country"]) {
      regions2018 = c(regions2018, whr2015[j,]["Region"])
      break
    }
  }
  if (!(country %in% whr2015$Country)) {
    regions2018 = c(regions2018, "FILL IN REGION")
  }
}

# Manually fill in the countries whose region was not provided
regions2018[[38]] = "Latin America and Caribbean"
regions2018[[49]] = "Latin America and Caribbean"
regions2018[[58]] = "Central and Eastern Europe"
regions2018[[98]] = "Sub-Saharan Africa"
regions2018[[119]] = "Sub-Saharan Africa"
regions2018[[154]] = "Sub-Saharan Africa"

# Insert regions dataframe into the main whr2017 dataframe

whr2018$Region = regions2018

#### ONLY 2019 DATASET ####

# Fill in Region based on data provided in 2015 dataset
regions2019 = list()
for (i in 1:nrow(whr2019)) {
  country = whr2019[i,]["Country or region"]
  for (j in 1:nrow(whr2015)) {
    if (country == whr2015[j,]["Country"]) {
      regions2019 = c(regions2019, whr2015[j,]["Region"])
      break
    }
  }
  if (!(country %in% whr2015$Country)) {
    regions2019 = c(regions2019, "FILL IN REGION")
  }
}

# Manually fill in the countries whose region was not provided
regions2019[[39]] = "Latin America and Caribbean"
regions2019[[64]] = "Central and Eastern Europe"
regions2019[[84]] = "Central and Eastern Europe"
regions2019[[112]] = "Sub-Saharan Africa"
regions2019[[113]] = "Sub-Saharan Africa"
regions2019[[120]] = "Sub-Saharan Africa"
regions2019[[156]] = "Sub-Saharan Africa"

# Insert regions dataframe into the main whr2017 dataframe

whr2019$Region = regions2019

# Combine all datasets into one full data report

full_report <- list(whr2015, whr2016, whr2017, whr2018, whr2019)

#################### DATA LOADING AND CLEANING COMPLETE #######################

