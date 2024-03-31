#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                                Koan #3: Piping
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# To complete this assignment, edit this R script inside the brackets for
# question 1, for example: between #1@ and @#1. Un-comment the line to make it
# live code instead of a comment (Ctrl Shift C on Windows; Cmd Shift C on Macs),
# save your progress (Ctrl/Cmd S), execute the code in the console (put your
# cursor in the piece of code and hit Ctrl/Cmd Return), and test your answer by
# running the test file (Ctrl/Cmd Shift T). When you've passed all tests, compile
# ("knit") the script to html (Ctrl/Cmd Shift K) and turn the html file in on
# Canvas.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started:
library(tidyverse)

us_data <- tibble(
  year      = c(1957, 1977, 1997, 2017),
  gdpPercap = c(14847, 24073, 35767, 60062),
  lifeExp   = c(69.5, 73.4, 76.8, 78.5)
)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Piping: %>%

# The pipe is *the most frequently used* function in the tidyverse. It lets
# us clearly express a sequence of functions without cluttering our programs
# with parentheses from function composition.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                       ----- What does the pipe do? -----

# Suppose you have a tibble named 'x', and you'd like to apply a function
# 'f' on it. So you run:

# f(x)
# (this won't actually run because 'x' and 'f' don't exist)

# But an alternative way to do that is:

# x %>% f()
# (again, this won't actually run)

# The pipe simply takes the data that comes before it, and inserts it
# into the function that comes after.

# The way you should read the pipe is with the word *then*.
# Read the above code as "Take x, *then* apply f."

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                              ----- Examples -----

# You can apply a function directly, or you can pipe the data into a function.
# So two ways to do the same thing are:

names(us_data)

us_data %>% names()

# 1. Your turn: apply 'nrow()' to us_data using a pipe. -------------------------
# This is what it looks like to apply the function directly:
# nrow(us_data)

#1@

# __ %>% __

#@1

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#                  ----- Applying a sequence of functions -----
#
# You can start to see how the pipe comes in handy when you string 2 or
# more functions together.

# Suppose you have a tibble named 'x', and you'd like to apply a function
# 'f' on it. But you're not done: you want to take the data structure that's
# the result of 'f(x)' and apply another function 'g()' on that.

# So you run:

# g(f(x))

# An alternative way to do that is:

# x %>% f() %>% g()

# Or using multiple lines:

# x %>%
#   f() %>%
#   g()

# The code is evaluated from top to bottom, so that 'f(x)' is evaluated
# and then the result is piped into 'g()'. If you're using multiple lines,
# the pipe must go at the end of the line.

# With function composition, you have to read inside out: 'g(f(x))'.
# With pipes, you read left to right: 'x %>% f() %>% g()',
# or top to bottom when using multiple lines. Pipes oftentimes help us
# make our code more *clear and readable*, which is one of our biggest
# goals for writing good code.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Example: take 'us_data', get the variable names by applying the function
# 'names()' on it, AND THEN see those names in a new tab by applying the
# function 'view()' to the result of 'us_data %>% names()':

# us_data %>%
#   names() %>%
#   view()

# The alternative:

# view(names(us_data))

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# What would it look like to pipe a data structure into a sequence of 3,
# or even 4 functions?

# x %>%
#   f() %>%
#   g() %>%
#   h()

# x %>%
#   f() %>%
#   g() %>%
#   h() %>%
#   i()

# The alternative gets cluttered fast:

# h(g(f(x)))
#
# i(h(g(f(x))))

# You'll see plenty of examples of piping 2, 3, 4, or more functions in
# later sections, so keep an eye out for that!

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Finally, read the qelp docs on the pipe to find out even more:

?qelp::`%>%`

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: filter, select, and mutate.
