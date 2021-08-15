# Intro to the Tidyverse by Colleen O'Briant

  # In order to progress, all you need to do is fill in the blanks: __.
  # Then run the code to make sure you're getting the desired result.
  # Use hotkeys for this: highlight the code you want to run, or put
  # your cursor at the end of the line. Then hit command + enter on a
  # mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# Tibbles
  
  # In the previous section, we learned how to hold data in vectors.
  # But real-world data is often held in 2 dimensional data frames like 
  # spreadsheets.

  # To create a spreadsheet in R, you'll put your data into column 
  # vectors and use the function 'tibble()' to combine columns.

#-------------------------------------------------------------------------

# First, read the qelp docs on 'tibble()':

?qelp::tibble

# Then load the tidyverse to get started:

library(tidyverse)

#-------------------------------------------------------------------------

# 1. Let's create a small tibble that has some data on US GDP per capita
# and life expectancy since 1957. Here's the data in written form:

# In 1957, US GDP per capita was $14,847 and life expectancy was 69.5 years.
# In 1977, US GDP per capita was $24,073 and life expectancy was 73.4 years.
# In 1997, US GDP per capita was $35,767 and life expectancy was 76.8 years.
# In 2017, US GDP per capita was $60,062 and life expectancy was 78.5 years.

# Fill in the blanks and run the code to save your tibble to your environment:

US_data <- tibble(
  year      = c(1957, 1977, 1997, __),
  gdpPercap = c(14847, 24073, 35767, __),
  lifeExp   = c(69.5, 73.4, 76.8, __)
)

# Tibbles have just 2 rules to follow:
#  1. Each column must be the same length (columns have 4 elements here),
#  2. Each column must be named ('year', 'gdpPercap', and 'lifeExp' are 
#     the names here).

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

view(US_data)

#-------------------------------------------------------------------------

# 2. How many rows and columns does the tibble have? Use the functions 
# 'nrow()' and 'ncol()'.

nrow(US_data) == __
ncol(US_data) == __

?qelp::nrow
?qelp::ncol

#-------------------------------------------------------------------------

# 3. You can get the column names of a tibble using 'names()'

names(US_data) == c("year", "gdpPercap", __)

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: Piping.
