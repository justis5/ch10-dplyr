# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
  acuras <- filter(vehicles, year == 2015, make == "Acura")
  best_acura <- filter(acuras, hwy == max(hwy))
  best_model <- select(best_acura, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_model <- select(
  filter(
    filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
  ), model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_model <- filter(vehicles, year == 2015, make == "Acura") %>% 
              filter(hwy == max(hwy)) %>% 
              select(model)

### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
temp_variables <- function() {
  acuras <- filter(vehicles, year == 2015, make == "Acura")
  best_acura <- filter(acuras, hwy == max(hwy))
  best_model <- select(best_acura, model)
}

nested_function <- function() {
  select(
    filter(
      filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
    ), model
  )
}

chained_function <- function() {
  filter(vehicles, year == 2015, make == "Acura") %>% 
    filter(hwy == max(hwy)) %>% 
    select(model)
}

system.time(for (i in 1:1000) temp_variables())
system.time(for (i in 1:1000) nested_function())
system.time(for (i in 1:1000) chained_function())
