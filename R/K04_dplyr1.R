#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#                Koan #4: filter, select, and mutate
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

# In this koan, you'll learn the first three dplyr verbs: 'filter', 'select',
# and 'mutate'.

#  dplyr is a package for data manipulation (the name is supposed to
#  evoke "data pliers"). It's included in the tidyverse, so you
#  automatically have access to all the dplyr functions whenever you attach
#  the tidyverse with 'library(tidyverse)'.

# dplyr is a SQL implementation. What is SQL? It stands for "Structured
# Query Language": it's a programming language for answering questions
# ("queries") about a dataset. With SQL (and with dplyr), you can transform
# your data into a neat table of results to answer just about any question
# you have about your data!

# As we'll see in this exercise and the next, you can use dplyr on a
# basic demographic dataset to answer questions like...
# What were the 5 richest countries in the 1950s?
# Which continent has the highest life expectancy on average?
# What year did Mexico have the highest population growth?

# SQL is wonderful because in order to answer all these questions, you
# only need to learn 7 functions! dplyr is the same way, except dplyr is
# EVEN MORE wonderful because, where SQL is very *structured*, dplyr is
# not. You can use the 7 dplyr functions in whichever order makes the
# most sense.

# In this exercise, we'll learn the first 3 dplyr functions:
# 'filter()', 'select()', and 'mutate()'.

# In the next exercise, we'll learn two more:
# 'summarize()' and 'group_by()'.

# Finally, we'll finish up by learning the last two:
# 'arrange()' and 'slice()'.

#-------------------------------------------------------------------------

# Run this code to get started and to view the dataset:

library(tidyverse)
# Un-comment the next line to install a new package 'gapminder', then re-comment it
# so you don't keep installing it.
# install.packages("gapminder")
library(gapminder)
view(gapminder)

#--- filter --------------------------------------------------------------

# The first dplyr function we'll learn is 'filter()'. It lets us filter
# our tibble by some logical condition, like "continent is equal to Europe".
# This gives us all the rows (observations) that have Europe as the continent.

gapminder %>%
  filter(continent == "Europe")

# You can filter on more than one logical condition at a time. This will
# return a tibble with all the gapminder observations from Asia in the year 1952.
# Recall that character strings ("Asia") need quotes, but variable names
# and numbers don't (continent, year, 1952).

gapminder %>%
  filter(continent == "Asia", year == 1952)

# Read the qelp docs on 'filter()':

?qelp::filter

# 1. Filter gapminder for all the observations from Europe in 2007.

#1@

# __

#@1

# 2. Filter gapminder for all the observations where lifeExp was exactly
# equal to 68 years old.

#2@

# __

#@2

#--- Logical Operators --------------------------------------------------

# The operator '==' reads "is equal to".
# But that's not the only logical operator you can use with 'filter()'.

# '!=': "not equal to"
# '>', '>=', '<', '<=': "greater than", "greater than or equal to", etc.
# '%in%': for "in"

# 3. Filter gapminder for a short list of the richest countries in Asia.

#3@

# gapminder %>%
#   filter(continent == __, gdpPercap __ 30000)

#@3

# 4. Filter gapminder for observations *IN* the United States, Germany,
# and Brazil.

#4@

# gapminder %>%
#   filter(country __ c("United States", "Germany", "Brazil"))

#@4

#--- select ----------------------------------------------------------------

# The function 'select()' lets you select columns (variables) of a tibble
# by name. No quotes are necessary because they're variable names.

gapminder %>%
  select(country, continent, year)

# 5: Select the last 3 variables of 'gapminder' by name:

#5@

# gapminder %>%
#   select(__, __, __)

#@5

# You can also use 'select()' to rename variables. For example, to create
# a tibble where the variable 'lifeExp' is changed to the name
# 'life_expectancy', you can do this:

gapminder %>%
  select(life_expectancy = lifeExp)

# Make sure to read the qelp docs on 'select()':

?qelp::select

#--- mutate --------------------------------------------------------------

# Use 'mutate()' to add new variables to your tibble. Those new variables
# can even be transformations of other existing variables. For example,
# we can create a variable called 'total_gdp' that is the product of
# 'pop' and 'gdpPercap'. I've piped it into 'view()' so you can verify that
# it worked.

# gapminder %>%
#   mutate(total_gdp = pop*gdpPercap) %>%
#   view()

# 6. Use 'mutate()' to create a new variable 'pop_in_thousands'. So if the
# observation has 'pop' = 97,462, then 'pop_in_thousands' will be 97.462.

#6@

# gapminder %>%
#   mutate(__)

#@6

# Read the qelp docs on 'mutate()':

?qelp::mutate

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: summarize and group_by.
