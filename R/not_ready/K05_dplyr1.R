# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# The first three dplyr verbs: 'filter', 'select', and 'mutate'

  #  dplyr is a package for data manipulation (the name is supposed to
  #  evoke "data pliers"). It's included in the tidyverse, so you
  #  automatically have access to all the dplyr functions whenever you attach
  #  the tidyverse.

  # dplyr is a SQL implementation. What is SQL? It stands for "Structured
  # Query Language": it's a programming language used for answering questions
  # ("queries") about a dataset. With SQL (and with dplyr), you can transform
  # your data into a neat table of results to just about any question you
  # have about your data!

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

# Run this code to get started and to view the data:

library(tidyverse)
# install.packages("gapminder")
library(gapminder)
# view(gapminder)

#--- 1. filter() ---------------------------------------------------------

# In the 'tibble' exercise, we learned that you can select certain rows
# from a tibble using square brackets specifying [rows, columns]:

gapminder[1, 1:6]

# But what if you wanted to select all the rows of the tibble that satisfy
# some condition, like all the observations from Asia in the year 1952?
# You can use 'filter()' for that. Recall that character strings need
# quotes but numbers don't.

gapminder %>%
  filter(continent == "Asia", year == 1952)

# Read the qelp docs on 'filter()':

?qelp::filter

# 1. filter 'gapminder' for all the observations from Europe in 2007.

# __


#--- 2. Logical Operators ------------------------------------------------

# The operator '==' reads "is equal to".
# But that's not the only logical operator you can use with 'filter()'.

# '!=': "not equal to"
# '>', '>=', '<', '<=': "greater than", "greater than or equal to", etc.
# '%in%': for "in"

# 2.1 'filter()' gapminder for a short list of the richest countries in
# Asia.

# gapminder %>%
#   filter(continent == __, gdpPercap __ 30000)

# 2.2 'filter()' gapminder for observations in the United States, Germany,
# and Brazil:

# gapminder %>%
#   filter(country __ c("United States", "Germany", "Brazil"))

#--- 3. 'select()' --------------------------------------------------------

# The function 'select()' lets you select columns (variables) of a tibble
# by name. No quotes are necessary.

gapminder %>%
  select(country, continent, year)

# 3.1: Select the last 3 variables of 'gapminder' by name:

# gapminder %>%
#   select(__, __, __)

# You can also use 'select()' to rename variables. For example, to create
# a tibble where the variable 'lifeExp' is changed to the name
# 'life_expectancy', you can do this:

gapminder %>%
  select(life_expectancy = lifeExp)

# Read the qelp docs on 'select()':

?qelp::select

#--- 4. 'mutate' -----------------------------------------------------------

# Use 'mutate()' to create new variables that are transformations of other
# variables in your tibble. For example, we can create a variable called
# 'total_gdp' that is the product of 'pop' and 'gdpPercap'.
# I've piped it into view() so you can verify that it worked.

# gapminder %>%
#   mutate(total_gdp = pop*gdpPercap) %>%
#   view()

# 4.1 Use 'mutate()' to create a new variable 'pop_in_thousands'. So if the
# observation has 'pop' = 97,462, then 'pop_in_thousands' will be 97.462.

# gapminder %>%
#   mutate(__)

# Read the qelp docs on 'mutate()':

?qelp::mutate

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next exercise, Exercise 5:
# summarize and group_by.
