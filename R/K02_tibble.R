#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                Koan #2: Tibbles
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank, un-comment the line
#    (Ctrl/Cmd Shift C), and execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk or
#    simply put your cursor at the end of the last line.
# 3. Save (Ctrl/Cmd S).
# 4. Test that your answers are correct (Ctrl/Cmd Shift T).

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Tibbles:

# In the previous koan, we learned how to hold data in vectors. But data
# usually comes to us in a table format (like a spreadsheet). When you're
# working with a tibble, you want to think of it as just a bunch of column
# vectors.

# Load the tidyverse to get started:

library(tidyverse)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Building a tibble -----
#
# To show you what a tibble is, I'll build one. Suppose I have some data on US
# GDP per capita and life expectancy since 1957. Here's the data in written
# form:
#
# In 1957, US GDP per capita was $14,847 and life expectancy was 69.5 years.
# In 1977, US GDP per capita was $24,073 and life expectancy was 73.4 years.
# In 1997, US GDP per capita was $35,767 and life expectancy was 76.8 years.

# Here's how to put that data into a tibble in R. Read this carefully and run
# the code (highlight the code you want to run or put your cursor at the end
# of an expression and hit Cmd-Return):

us_data <- tibble(
  year = c(1957, 1977, 1997),
  gdpPercap = c(14847, 24073, 35767),
  lifeExp = c(69.5, 73.4, 76.8)
)

us_data

# Notice that in order to build a tibble, you define vectors with 'c' that
# become the columns of the table. The columns have names.

# Now take some data for Canada:
# In 1957, GDP per capita in Canada was $12,490 and life expectancy was 70.0 years.
# In 1977, GDP per capita in Canada was $22,091 and life expectancy was 74.2 years.
# In 1997, GDP per capita in Canada was $28,955 and life expectancy was 78.0 years.

# 1. Create a tibble that holds the canada_data: -------------------------------

#1@

# canada_data <- tibble(
#   year      = __,
#   gdpPercap = __,
#   lifeExp   = __
# )

# canada_data

#@1

# Tibbles are pretty strict. They have 2 rules you must follow:
#  1. Each column must be named ('year', 'gdpPercap', and 'lifeExp' are the
#     names here). If you try to define a column without giving it a name,
#     'tibble' will come up with the name for you.
#  2. Each column must have the same number of rows (each column vector has 3
#     elements, so each column vector has 3 rows, and the tibble has 3 rows). If
#     you try to define a column that's shorter than the others, 'tibble' will
#     either recycle the values of that column to make it long enough, or it
#     will give you an error.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- Inspecting your tibble -----

# There are a few ways to see the data held in the tibble. The first way is
# to print the tibble to your console either by using the function 'print',
# or calling the dataset's name:

print(us_data)

us_data

# A tibble: 4 x 3
#    year  gdpPercap lifeExp
#    <dbl>    <dbl>    <dbl>
# 1  1957     14847    69.5
# 2  1977     24073    73.4
# 3  1997     35767    76.8
# 4  2017     60062    78.5

# Another way is to use 'view()' to look at the data in a separate tab.

# view(us_data)

# Un-comment this line of code with Ctrl/Cmd Shift C. Then after running it,
# re-comment it using the same hotkeys. Why did I comment out view()?
# It doesn't play nicely with my koan tests (it opens a view tab each test,
# which will be slow and painful for you). It's best to always comment out
# view() calls in the koans.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Tibble Dimensions -----

# You can use the functions 'nrow()' and 'ncol' to find the dimensions of the
# tibble. For instance, this tells us that us_data has 3 rows:

nrow(us_data)

# 2. How many columns does us_data have? ---------------------------------------

#2@

# ncol(us_data) == __

#@2

?qelp::nrow
?qelp::ncol

# In a tibble, columns are called *variables*. Rows are called *observations*.
# This is very important to understand. In our tibble, the *variables* (columns)
# are 'year','gdpPercap', and 'lifeExp': they're the things that were measured
# for each *observation* (row): for 1957, 1977, and 1997.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Variable Names -----

# You can get the variable (column) names of a tibble using 'names()':

# 3. What does names() return when you apply it to us_data? --------------------

#3@

# names(us_data) == c("year", "gdpPercap", __)

#@3

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                         ----- Adding Rows -----

# Suppose you want to append a row (or several) to your dataset. You can do that
# using the function 'add_row()'. It takes the tibble as the first argument and
# then variable names and values to construct the new row. Suppose we got a new
# observation (row) about Canada: In 2007, GDP per capita in Canada was $36,319
# and life expectancy was 80.7 years.


#4@

# add_row(
#   canada_data,
#   year = __,
#   gdpPercap = __,
#   lifeExp = __
# )

#@4

# Make sure to read the qelp docs for 'tibble':
?qelp::tibble

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: Piping.
