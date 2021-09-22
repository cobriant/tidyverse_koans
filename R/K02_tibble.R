#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#                          Koan #2: Tibbles
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

#                             Tibbles

  # In the previous koan, we learned how to hold data in vectors.
  # But data usually comes to us in a table format (like a spreadsheet).
  # Tibbles are tidyverse spreadsheets.

#-------------------------------------------------------------------------

# Load the tidyverse to get started:

library(tidyverse)

#-------------------------------------------------------------------------

# To show you what a tibble is, I'll build one. Suppose I have some data
# on US GDP per capita and life expectancy since 1957. Here's the data
# in written form:

# In 1957, US GDP per capita was $14,847 and life expectancy was 69.5 years.
# In 1977, US GDP per capita was $24,073 and life expectancy was 73.4 years.
# In 1997, US GDP per capita was $35,767 and life expectancy was 76.8 years.

# Here's how to put that data into a tibble in R. Read this carefully and
# run the code:

US_data <- tibble(
  year = c(1957, 1977, 1997),
  gdpPercap = c(14847, 24073, 35767),
  lifeExp = c(69.5, 73.4, 76.8)
)

US_data

# Notice that in order to build a tibble, you define vectors with 'c'
# that become the columns of the table. The columns have names.

# Now suppose we get new data for 2017. We'd like to add a row to the bottom:
# In 2017, US GDP per capita was $60,062 and life expectancy was 78.5 years.

# Fill in the blanks and run the code to save your tibble to your environment:

#1@

# US_data <- tibble(
#   year      = c(1957, 1977, 1997, __),
#   gdpPercap = c(14847, 24073, 35767, __),
#   lifeExp   = c(69.5, 73.4, 76.8, __)
# )

#@1

# Tibbles are pretty strict. They have 2 rules you must follow:
#  1. Each column must be named ('year', 'gdpPercap', and 'lifeExp' are
#     the names here). If you try to define a column without giving it
#     a name, 'tibble' will come up with the name for you.
#  2. Each column must have the same number of rows (each column vector
#     has 4 elements, so each column vector has 4 rows, and the tibble
#     has 4 rows). If you try to define a column that's shorter than the
#     others, 'tibble' will either recycle the values of that column to
#     make it long enough, or it will throw an error.

#-------------------------------------------------------------------------

# There are a few ways to see the data held in the tibble. The first way is
# to print the tibble to your console either by using the function 'print',
# or calling the dataset's name:

print(US_data)

US_data

# A tibble: 4 x 3
#    year  gdpPercap lifeExp
#    <dbl>    <dbl>    <dbl>
# 1  1957     14847    69.5
# 2  1977     24073    73.4
# 3  1997     35767    76.8
# 4  2017     60062    78.5

# Another way is to use 'view()' to look at the data in a separate tab.

# view(US_data)

# Un-comment this line of code with Ctrl/Cmd Shift C. Then after running it,
# re-comment it using the same hotkeys. Why did I comment out view()?
# It doesn't play nicely with my koan tests (it opens a view tab each test,
# which will be slow and painful for you).

#-------------------------------------------------------------------------

# 2. Use the functions 'nrow()' and 'ncol' to find the dimensions of the
#    tibble. For instance, this tells us that US_data has 4 rows:

nrow(US_data)

# How many columns does US_data have?

#2@

# ncol(US_data) == __

#@2

?qelp::nrow
?qelp::ncol

# In a tibble, columns are called *variables*. Rows are called *observations*.
# This is very important. Think about it and remember it.

#-------------------------------------------------------------------------

# 3. You can get the column names (variable names) of a tibble using 'names()':

#3@

# names(US_data) == c("year", "gdpPercap", __)

#@3

# Make sure to read the qelp docs for 'tibble':
?qelp::tibble

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: Piping.
