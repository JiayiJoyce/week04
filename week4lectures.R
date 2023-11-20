# Install packages
if (!require("pacman")) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse, # tidyverse pkgs including purrr
  glue, #combining strings and objects
  gapminder, # dataset
  ggplot2, #plotting
  gridExtra #arranging plots
) 

average = 69.4

if (average > 69) {
  print("Firs-class honours")
} else if (average < 70 & average > 59) {
  print("Second-class honours")
} else {
  print("Third-class honours")
}

simple.function <- function(x, y){
  print(x - y + 1)
}

simple.function(x = 2, y = 10)


#purrr is a part of tidyverse

# Create a list of data frames with England's biggest cities and their populations
data_list <- list(
  data.frame(City = c("London", "Birmingham", "Manchester"),
             Population = c(8961989, 1141816, 547627)),
  data.frame(City = c("Leeds", "Liverpool", "Newcastle"),
             Population = c(793139, 494814, 148190))
)

# Define the condition for filtering data frames
population_threshold <- 500000

filtered_data <- map(data_list, ~ filter(.x, Population >= population_threshold))

filtered_data