function(){#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  #                   Intro to the Tidyverse by Colleen O'Briant
  #                                Koan #17: lag()
  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # In order to progress:
  # 1. Read all instructions carefully.
  # 2. When you come to an exercise, fill in the blank, un-comment the line
  #    (Ctrl/Cmd Shift C), and execute the code in the console (Ctrl/Cmd Return).
  #    If the piece of code spans multiple lines, highlight the whole chunk or
  #    simply put your cursor at the end of the last line.
  # 3. Test that your answers are correct (Ctrl/Cmd Shift T)
  # 4. Save (Ctrl/Cmd S).

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  library(tidyverse)
  library(gapminder)

  # In this koan, you'll practice using the function lag() from dplyr.
  # It takes a vector and finds the previous values for that vector.

  ?lag

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  # 1. Create a vector with the numbers 1 through 5 (use 'c()' or ':'). --------

#1@

# __

#@1


# 2. Call lag() on that vector. Observe that the first element of the lagged----
  # version of your vector is an "NA": a missing value.

#2@

# __

#@2


# 3. Call lag() on your vector, but specify that you want the second lag -------
  # with the argument 'n'.

#3@

# __

#@3


# 4. Take gapminder and create a new variable called 'lag_gdpPercap' -----------
# that is the variable gdpPercap, lagged once.

#4@

# gapminder %>%
#   mutate(lag_gdpPercap = __)

#@4


# 5. Define a function 'pct_change' that takes two values and calculates -------
# the percentage change between them. See if you can recall how to write this
  # function without referring back to when we did it before.

#5@

# pct_change <- __

#@5


# 6. Add a new variable to gapminder that is 'gdp_pct_change': the percent -----
  # change from one observation to the next. You'll do this by calling your
  # function pct_change on gdpPercap and the lag of gdpPercap.

#6@

# gapminder %>%
#   mutate(gdp_pct_change = __)

#@6


# 7. The only issue with problem 6 is that we'll calculate the -----------------
  # gdp_pct_change in Albania in 1952 as the change between Albania's gdpPercap
  # in 1952 and Afganistan's gdpPercap in 2007, since the two observations are
  # next to each other. Obviously, that's not correct. We only want
  # gdp_pct_change to be calculated within the same country. Try repeating your
  # answer to problem 6, but first grouping by country.

#7@

# gapminder %>%
#   group_by(__) %>%
#   mutate(gdp_pct_change = __)

#@7


# 8. What countries had the largest growth in GDP per capita? ------------------
  # (Hint: use 'arrange')

#8@

# __

#@8

  #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: first differences.
}
