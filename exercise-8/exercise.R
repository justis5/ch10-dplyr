# Exercise 8: exploring data sets

# Load the dplyr library
library(dplyr)

# Read in the data (from `data/pupulitzer-circulation-data.csv`). Remember to 
# not treat strings as factors!
data <- read.csv("data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)

# View in the data set. Start to understand what the data set contains
View(data)

# Print out the names of the columns for reference
colnames(data)

# Use the 'str()' function to also see what types of values are contained in 
# each column (you're looking at the second column after the `:`)
# Did any value type surprise you? Why do you think they are that type?
str(data) # Why is daily circulation in characters?

# Add a column to the data frame called 'Pulitzer.Prize.Change` that contains 
# the difference in the number of times each paper was a winner or finalist 
# (hereafter "winner") during 2004-2014 and during 1990-2003
data <- data %>% 
  mutate(Pulitzer.Prize.Change = Pulitzer.Prize.Winners.and.Finalists..2004.2014 
         - Pulitzer.Prize.Winners.and.Finalists..1990.2003)

# What was the name of the publication that has the most winners between 
# 2004-2014?
most_winners <- data %>% 
  filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 ==
           max(Pulitzer.Prize.Winners.and.Finalists..2004.2014)) %>% 
  select(Newspaper)


# Which publication with at least 5 winners between 2004-2014 had the biggest
# decrease(negative) in daily circulation numbers?
biggest_decrease <- data %>% 
  filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 5) %>% 
  filter(Change.in.Daily.Circulation..2004.2013 == min(Change.in.Daily.Circulation..2004.2013)) %>% 
  select(Newspaper)
  
# An important part about being a data scientist is asking questions. 
# Write a question you may be interested in about this data set, and then use  
# dplyr to figure out the answer!
# Which publication has had the greatest increase in the number of Pulitzers?
most_improved <- data %>% 
  filter(Pulitzer.Prize.Change == max(Pulitzer.Prize.Change)) %>% 
  select(Newspaper, Pulitzer.Prize.Change)
