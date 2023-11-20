#Again import the dataset called “Natural disasters (EMDAT)”
EMDAT <- read.csv("/Users/chenjiayi/Desktop/Computational/PublicRepoforSOCS0100Wk3/EMDAT.csv")

pacman::p_load(
  tidyverse, # the tidyverse framework
  skimr# quickly providing a broad overview of a data frame
)
if (!require("pacman")) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse, # tidyverse pkgs including purrr
  kableExtra,#table
  flextable, #table
  glue, #combining strings and objects
  ggplot2) #dataviz

deathinjuredhomeless <- EMDAT %>%
  select(injured_all_disasters,homeless_all_disasters,deaths_all_disasters,Entity,Year)
#Using purrr, please automate at least one data wrangling task based on the dataset (e.g. summarising data)
 glimpse(deathinjuredhomeless)
 
fiveperm<- deathinjuredhomeless %>%
  filter(Entity %in% c("China","Russia","United States","France","United Kingdom"))


#Using purrr please automate plotting the trends of deaths, injuries, and homelessness caused by all disasters for 5 countries in the dataset
# 
creat_line_plot <- function (i) {
  fiveperm %>%
    ggplot(fiveperm, aes(x = Year, y = names(fiveperm)[i] , linetype = Entity)) +
    geom_smooth()
  labs(
    title= glue("Number of {names(fiveperm)[i]} over the years"),
    y= glue("{names(fiveperm)[i]}")
  )
}

# plots_list <- map(1:3, create_line_plot)
# plots_list

options(scipen=999)
ggplot(fiveperm, aes(x = Year, y = deaths_all_disasters , linetype = Entity)) + geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue") 
  geom_smooth()
  