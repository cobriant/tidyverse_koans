#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#                      Koan #7: left_join
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

# In this exercise, you'll learn about left_join(), which is one
# way to join two tibbles when you have variables that link them together.

# Run this code to get started. Make sure you have an internet connection,
# or reading in data from the web will not work.

library(tidyverse)
people <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/person.csv")
drivers_license <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/drivers_license.csv")
income <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/income.csv")

#-------------------------------------------------------------------------

# You have 3 new datasets in the global environment. The first one we'll
# work on is `people`. Don't worry: all the SSNs, along with all the other
# information, is made up.

# Un-comment the code below (Ctrl/Cmd Shift C) to run and take a look at the
# 'people' dataset:

# view(people)

# To find information about someone named Daniel Dumire, we can filter()
# on name:

people %>%
  filter(name == "Daniel Dumire")

# You can also use `str_detect()` to detect a character string for partial
# matches:

people %>%
  filter(str_detect(name, "Daniel"))

# Read the qelp docs on str_detect:
?qelp::str_detect

# The carrot `^` means "starts with":

people %>%
  filter(str_detect(name, "^Daniel"))

# The dollar sign `$` means "ends with":

people %>%
  filter(str_detect(name, "nson$"))

#-------------------------------------------------------------------------

# 1. Query the data to find out if there's anyone with your first or last
# name using `|`, which is the logical operator for "or".

#1@

# people %>%
#   filter(str_detect(__, __) | str_detect(__, __))

#@1

#-------------------------------------------------------------------------

# 2. Use 'select()' to find Daniel Dumire's license_id.

#2@

# people %>%
#   filter(__) %>%
#   select(__)

#@2

# 3. Now look for Daniel Dumire in the 'drivers_license' tibble. The problem:
# there's no 'name' column in that tibble. You have to search instead by
# 'id'. That is, 'license_id' in the 'people' tibble can be matched with
# 'id' in the 'drivers_license' tibble.

#3@

# drivers_license %>%
#   filter(id == __)

#@3

#-------------------------------------------------------------------------

# 4. Find a person whose name is Bennett Jimmerson and find their income.
#   You can follow the same 2-step process as 2 and 3. Which variables
#   can be matched between 'income' and 'people'? (use 'names(income)'
#   and 'names(people)' to quickly remind yourself of the variables in
#   each tibble)

#4@

# __

# __

#@4

#-------------------------------------------------------------------------

# A more efficient way to solve questions like 2, 3, and 4 is to join
# the tibbles by the matching variables, which are called "keys".

# We can join 'people' and 'drivers_license' by 'license_id' = 'id':

people %>%
  left_join(drivers_license, by = c("license_id" = "id"))

?qelp::left_join

# To get a complete set of information about Daniel Dumire,
# I join 'people' with 'drivers_license' by the keys the two tibbles
# have in common, then filter on "Daniel Dumire" and select the
# information I'm interested in:

people %>%
  left_join(drivers_license, by = c("license_id" = "id")) %>%
  filter(name == "Daniel Dumire") %>%
  select(name, age, height, eye_color, hair_color, gender, car_make)

#-------------------------------------------------------------------------

# 5. Your turn: use left_join() to join 'people' with 'income'.
# Since the key has the same name in both tibbles ("ssn"), 'by = "ssn"'
# will work.

#5@

# __ %>%
#  __(__, by = "ssn")

#@5

# 6. Copy-paste your code for (5) and add another step, querying the
# resulting tibble to find Daniel Dumire's income.

#6@

# __

#@6

#-------------------------------------------------------------------------

# 7. One more join problem: join 'drivers_license' with 'income'. This is
# tricky because they don't share any keys! You'll have to use 'left_join'
# twice and make use of the 'people' tibble.

#7@

# __

#@7

#-------------------------------------------------------------------------

# Last notes about joins:

# We've been joining and then filtering, like this:

people %>%
  left_join(drivers_license, by = c("license_id" = "id")) %>%
  filter(name == "Daniel Dumire")

# But if you're only interested in Daniel Dumire, then you can also
# filter and then join, like this:

people %>%
  filter(name == "Daniel Dumire") %>%
  left_join(drivers_license, by = c("license_id" = "id"))

# left_join() is one of the most useful joins, and it's the only join
# you'll need to solve the murder mystery in project 2, but there are others.
# 95% of the time, you'll only ever need left_join() and inner_join().
# Check out the dplyr cheat sheet (page 2, right hand side) for more information:
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to koan 8: qplot to ggplot.
