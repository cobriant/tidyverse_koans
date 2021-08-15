# Intro to the Tidyverse by Colleen O'Briant

# In order to progress, all you need to do is fill in the blanks: __.
# Then run the code to make sure you're getting the desired result.
# Use hotkeys for this: highlight the code you want to run, or put
# your cursor at the end of the line. Then hit command + enter on a
# mac, or ctrl + enter on windows.

#-------------------------------------------------------------------------

# Run this code to get started:

library(tidyverse)

world_data <- tibble(
  country   = c("Brazil", "Brazil", "Brazil", "Brazil",
                "Haiti", "Haiti", "Haiti", "Haiti",
                "Puerto Rico", "Puerto Rico", "Puerto Rico", "Puerto Rico",
                "Colombia", "Colombia", "Colombia", "Colombia"),
  year      = c(1952, 1972, 1992, 2007, 1952, 1972, 1992, 2007,
                1952, 1972, 1992, 2007, 1952, 1972, 1992, 2007),
  gdpPercap = c(2108.944,  4985.711,  6950.283,  9065.801,
                1840.367,  1654.457,  1456.310,  1201.637,
                3081.960,  9123.042, 14641.587, 19328.709,
                2144.115,  3264.660,  5444.649,  7006.580),
  lifeExp   = c(50.9, 59.5, 67.1, 72.4, 37.6, 48, 55.1, 60.9, 
                64.3, 72.2, 73.9, 78.7, 50.6, 61.6, 68.4, 72.9)
)

#-------------------------------------------------------------------------

# Your data is called 'world_data'. It tells you the GDP per capita and
# life expectancy for four different countries during four different years.

view(world_data)

# Read the qelp docs for 'qplot()' for some ideas about how to use it:

?qelp::qplot

# Make 3 visualizations of different aspects of the data.
# Experiment with using 'color' or 'fill', using geom = "point",
# geom = "line", and geom = "histogram", and give your plots
# main titles.

# Write the code for your 3 plots here:

# Plot 1:

__

# Plot 2:

__

# Plot 3:

__

#-------------------------------------------------------------------------

# Great work! You're one step closer to tidyverse enlightenment.
# Make sure to return to this topic to meditate on it later.

# If you're ready, you can move on to the next koan: lm.
