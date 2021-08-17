# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# Custom Functions

  # In this exercise we'll learn how to write our own custom functions in R.

  # So far, we've learned about a lot of great functions that make data
  # analysis easy. For example, all these are functions:
  # 'sum()', 'mean()', 'qplot()', 'lm()', 'ggplot()', 'filter()', 'summarize()'

  # Functions take arguments as inputs, perform an action in the body,
  # and produce some output at the end. If you're having trouble using a
  # function from the tidyverse, it's probably because there's something about
  # the function's arguments, body, or output that you're not understanding.

#-------------------------------------------------------------------------

# Run this code to get started:
library(tidyverse)
library(gapminder)

#-------------------------------------------------------------------------

# This is the format for defining a function in R:

# my_function <- function(arg1, arg2, arg3){
#     body
#     return(output)
# }

# 'my_function' is the name of the function. You can call your functions
# (almost) anything you'd like. Names can have letters, numbers, periods, and
# underscores, but they should always start with a letter. It's also good
# practice to avoid using common names for your functions so that your functions
# have unique names. That is, if you plan on using 'dplyr::filter', don't create
# a function named 'filter'.

# 'arg1', 'arg2', and 'arg3' are the function arguments. You can have any
# number of arguments, including zero.

# 'body' defines the action that the function takes.

# 'output' is the output of the function.

#-------------------------------------------------------------------------

# Example: this is a function that adds two numbers.

plus <- function(a, b){
    return(a + b)
}

plus(5, 3)

# 1. Does it work on numbers? Fill in the blanks to make the code return
# TRUE.

# plus(__, __) == 3

# 2. Does it work on vectors?

# plus(__, __) == c(4, 0, 1)

#-------------------------------------------------------------------------

# 3. Write a function that takes one argument as the input and returns its
#    square.
#    So for example, 'square(6)' will return 36. You can name the argument
#    anything you want (x, y, arg1, etc), as long as you're consistent.

# square <- function(__){
#   __
# }

# 4. Does it work on numbers?

# square(__) == 16

# 5. Does it work on vectors?

# square(__) == c(1, 4, 9)

# Test that it works inside 'mutate()':

# gapminder %>%
#   mutate(gdpPercap_squared = square(gdpPercap))

#-------------------------------------------------------------------------

# If you aren't explicit about what you want the output of your function
# to be by using 'return()', R will automatically return the last thing
# it evaluated. So in our simple 'plus' function, we can simply define it as:

plus <- function(a, b){
    a + b
}

plus(2, 3)

# Note that this will also output a + b,
# because a + b was the last thing the function evaluated:

plus <- function(a, b){
    a - b
    a + b
}

plus(2, 3)

# To get your function to output multiple values,
# you'll need to return a vector:

plus_minus <- function(a, b){
    c(a - b, a + b)
}

plus_minus(5, 2)

#-------------------------------------------------------------------------

# You can even write a function that outputs a plot:

scatterplot <- function(tibble, xaxis, yaxis){
    ggplot(data = tibble, aes(x = {{ xaxis }}, y = {{ yaxis }})) +
        geom_point()
}

# 6. Test that 'scatterplot' works using 'gapminder', any variable
# in 'gapminder' on the x-axis, and any variable in 'gapminder'
# on the y-axis.

# scatterplot(__, __, __)

# You can make arguments optional by setting default values for them.

scatterplot2 <- function(tibble, xaxis, yaxis, point_color = "pink", point_alpha = .5){
    ggplot(data = tibble, aes(x = {{ xaxis }}, y = {{ yaxis }})) +
        geom_point(color = point_color, alpha = point_alpha)
}

# 7. Test that scatterplot2 works with 'gapminder'.

# scatterplot2(__, __, __, __, __)

# 8. If you don't specify a point_color, what color will the points be?

#----------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.
