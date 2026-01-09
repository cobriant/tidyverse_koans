#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                   Intro to the Tidyverse by Colleen O'Briant
#                            Koan #8: qplot to ggplot
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

# The tidyverse ecosystem has 2 great ways to draw plots: they are qplot() and
# ggplot(). You've already had some practice drawing qplots in classwork 2.
# qplot() was designed to be a simplified version of ggplot(), so you already
# have a head start with learning ggplot()!

# What's with the name?
# The double g's in 'ggplot' stand for the "grammar of graphics". The idea is
# that you shouldn't have to memorize tons of details about how a plotting tool
# works in order to create the right visualization for your data. Instead, your
# plotting tool should work like a language in itself. Once you understand how
# to speak the language, you can start building your own visualizations to
# communicate your unique ideas very fast.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Run this code to get started and to take a look at the data:

library(tidyverse)
library(gapminder)
usdata <- filter(gapminder, country == "United States")
# view(usdata)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You've practiced building scatterplots with qplot() like this:

qplot(data = usdata, x = gdpPercap, y = lifeExp)

# 1. Replicate that scatterplot using ggplot() with a points layer: ------------

#1@

# ggplot(data = __, aes(x = __, y = __)) +
#   geom_point()

#@1

# Notice ggplot() wraps x and y in 'aes'. We'll talk more about that in the next
# koan: ggplot aesthetic mappings.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You've also practiced adding main titles and axis labels to your qplot:

qplot(
  data = usdata,
  x = gdpPercap,
  y = lifeExp,
  main = "As GDP per capita increases, so does life expectancy",
  xlab = "GDP per capita",
  ylab = "Life expectancy"
)

# 2. Add a main title and axis labels (labs) to your ggplot: -------------------

#2@

# ggplot(data = __, aes(x = __, y = __)) +
#   geom_point() +
#   labs(x = __, y = __, title = __)

#@2

# Notice that with 'ggplot()', functions are added '+' to the main ggplot call.
# These are called layers. So a layer is added to draw the points of the
# scatterplot, and another layer is added to draw axis labels and a title.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# You've also practiced using multiple geoms with a qplot:

qplot(
  data = usdata,
  x = gdpPercap,
  y = lifeExp,
  geom = c("point", "line", "smooth")
)

# 3. Use multiple geom's in a ggplot (if there's no blank '__', you don't ------
#    need to write anything!):

#3@

# ggplot(data = __, aes(x = __, y = __)) +
#   geom_point() +
#   geom_line() +
#   geom_smooth()

#@3

# Notice that with 'ggplot()', to add multiple geoms, you add '+' layers.

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Great work! You're one step closer to tidyverse enlightenment. Make sure to
# return to this topic to meditate on it later.

# If you're ready, you can move on to koan 9: ggplot aesthetic mappings.
