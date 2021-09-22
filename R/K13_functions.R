#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#                   Koan #13: Custom Functions
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

# In this koan you'll learn how to write your own custom functions in R.

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
# a function named 'filter'. And if you plan on using 'c()' to create a vector,
# don't name anything else 'c'.

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

#1@

# plus(__, __) == 3

#@1


# 2. Does it work on vectors?

#2@

# plus(__, __) == c(4, 0, 1)

#@2

#-------------------------------------------------------------------------

# 3. Write a function that takes one argument as the input and returns its
#    square.
#    So for example, 'square(6)' will return 36. You can name the argument
#    anything you want (x, y, arg1, etc), as long as you're consistent.

#3@

# square <- function(__){
#   __
# }

#@3


# 4. Does it work on numbers?

#4@

# square(__) == 16

#@4


# 5. Does it work on vectors?

#5@

# square(__) == c(1, 4, 9)

#@5


# 6. Test that it works inside 'mutate()': Take 'gapminder' and add a new
# variable 'gdpPercap_squared' that is the square of the gdpPercap variable.

#6@

# __

#@6

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

# 7. Your turn: write a function that takes zero arguments and returns
# the number 1 and also a number drawn from N(1, 1).

#7@

# ones <- function(){
#   __
# }

# ones()

#@7

#-------------------------------------------------------------------------

# Your custom functions can output anything: a value, a vector, a tibble,
# another function, and even a plot! Here's a function called 'scatterplot'
# that outputs a ggplot with geom_point(). The curly braces that wrap
# 'xaxis' and 'yaxis' will be explained in the next koan:

scatterplot <- function(tibble, xaxis, yaxis){
    ggplot(data = tibble, aes(x = {{ xaxis }}, y = {{ yaxis }})) +
        geom_point()
}

# 8. Test that 'scatterplot' works using 'gapminder', any variable
# in 'gapminder' on the x-axis, and any variable in 'gapminder'
# on the y-axis.

#8@

# scatterplot(__, __, __)

#@8


# Lastly, I want to mention that function arguments can have
# default values. For instance, geom_point() dots have color = black
# if you don't change the color. And the geom_smooth() line is blue
# by default. Suppose I want my points in my scatterplot to be pink
# by default. Here's how I can do that:

scatter_pink <- function(tibble, xaxis, yaxis, point_color = "pink"){
    ggplot(data = tibble, aes(x = {{ xaxis }}, y = {{ yaxis }})) +
        geom_point(color = point_color)
}

# If I don't declare a point_color, my scatterplot ends up being pink:

scatter_pink(gapminder, gdpPercap, lifeExp)

# But if I do declare a point_color, my scatterplot becomes that color.

# 9. Use 'scatter_pink' to draw a gapminder scatterplot with *blue* points.

#9@

# scatter_pink(__, __, __, __)

#@9

#----------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.
