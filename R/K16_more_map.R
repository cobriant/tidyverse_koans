function(){#----------------------------------------------------------------
  #            Intro to the Tidyverse by Colleen O'Briant
  #                      Koan #16: More map()
  #-------------------------------------------------------------------------

  # In order to progress:
  # 1. Read all instructions carefully.
  # 2. When you come to an exercise, fill in the blank, un-comment the line,
  #    and execute the code in the console (Ctrl/Cmd Return). If the piece
  #    of code spans multiple lines, highlight the whole chunk or simply put
  #    your cursor at the end of the last line.
  # 3. Test that your answers are correct (Ctrl/Cmd Shift T)
  # 4. Save (Ctrl/Cmd S).

  #-------------------------------------------------------------------------

  # In this koan, you'll get more practice using map(.x, .f).

  # Run this code to get started:

  library(tidyverse)
  library(gapminder)

  #-------------------------------------------------------------------------

  # In the last koan, we used 'map(.x, .f)' to generate a list of 100 sets
  # of 10 random numbers with increasing standard deviations like this:

  # map(.x = 1:100, .f = ~ rnorm(n = 10, mean = 0, sd = .x))

  # In that 'map' call, I used a formula to reference '.x' directly using
  # the tilde symbol '~'. We saw you could also use anonymous or named
  # functions:

  # Anonymous functions:

  # map(.x = 1:100, .f = function(input) rnorm(n = 10, mean = 0, sd = input))

  # Named functions:

  # rnorm_sd <- function(input){
  #   rnorm(n = 10, mean = 0, sd = input)
  # }

  # map(.x = 1:100, .f = rnorm_sd)

  #-------------------------------------------------------------------------

  # Suppose we want to take the vector 1:10 and multiply each element by 3.
  # Multiplication is vectorized, so this is clearly the best way:

  (1:10)*3

  # But your task will be to use map(.x, .f) to solve that simple problem:
  # take the vector 1:10 and multiply each element by 3.

  # 1. Use a named function as `.f`:

  #01@

  # multiply_by_three <- function(a){
  #   __
  # }
  #
  # map(.x = 1:5, .f = multiply_by_three)

  #@01


  # 2. Use an anonymous function as '.f':

  #02@

  # map(.x = 1:5, .f = function(a) __)

  #@02


  # 3. Use a formula as '.f':

  #03@

  # map(.x = 1:5, .f = ~ __ )

  #@03

  #-------------------------------------------------------------------------

  # Simulation with map(.x, .f):

  # In class, we discussed that when an explanatory variable is measured
  # with error (perhaps people misreport their information), its estimate
  # is attenuated (closer to zero than the true value). In this section,
  # we'll simulate that result.

  # 4. Fill in the blanks to generate a dataset with two variables:
  #    x should take values sampled randomly from 1 to 10.
  #    y should be 3 + 2*x + u, where u is iid N(mean = 0, sd = 10).

  #04@

  # tibble(
  #   x = sample(1:10, size = 10000, replace = T),
  #   y = __ + __*x + __
  # )

  #@04


  # 5. Take the dataset you defined above and add a new variable:
  #    `x_observed`. It should be x + a measurement error, which we'll
  #    say is distributed N(mean = 0, sd = 1).

  #05@

  # tibble(
  #   x = sample(1:10, size = 10000, replace = T),
  #   y = __ + __*x + __,
  #   x_observed = __
  # )

  #@05


  # 6. Take the dataset you defined above and use lm() to estimate
  # the effect of x on y. You should get a number close to 2.
  # Then estimate the effect of x on y *using x_observed instead of x*.
  # In the presence of measurement error, the researcher doesn't get
  # to see x. They only see x_observed. Run the code multiple times.
  # Do you still get estimates for the effect of x on y that is close
  # to 2, or do the estimates seem biased?

  #06@

  # tibble(
  #   x = sample(1:10, size = 10000, replace = T),
  #   y = __ + __*x + __,
  #   x_observed = __
  # ) %>%
  #   lm(__, data = .) %>%
  #   broom::tidy()

  #@06


  # 7. In this step, we'll use 'map(.x, .f)' to generate 100
  # datasets, run lm() on each of them, and report the estimates
  # of the effect of x on y for each regression.

  # .x will be the sequence 1:100. This will run .f 100 times.
  # .f will be a function that:
  # - Takes no arguments (use '...' to let .f take .x without doing anything with it)
  # - Generates a new dataset (with x, y, and x_observed),
  # - Runs a regression of x_observed on y,
  # - And outputs the estimate for the effect of x_observed on y.

  #07@

  # map(
  #   .x = __,
  #   .f = function(...){
  #     tibble(
  #       __
  #     ) %>%
  #       lm(y ~ x_observed, data = .) %>%
  #       broom::tidy() %>%
  #       select(estimate) %>%
  #       slice(2)
  #   }
  # )

  #@07


  # 8. In the last step, you should have created a long list
  # of estimates. Try using 'map_dfr(.x, .f)' instead of 'map(.x, .f)'.
  # The only difference is that 'map_dfr' will output a dataframe (a tibble)
  # instead of a list.

  #08@

  # map_dfr(
  #   .x = __,
  #   .f = function(...){
  #     tibble(
  #       __
  #     ) %>%
  #       lm(y ~ observed_x, data = .) %>%
  #       broom::tidy() %>%
  #       select(estimate) %>%
  #       slice(2)
  #   }
  # )

  #@08


  # 9. Now that we have a dataframe of simulation results,
  # let's pipe the results into ggplot for visualization. Use
  # geom_density() to visualize the distribution of estimates
  # you calculated.

  #09@

  # map_dfr(
  #   .x = __,
  #   .f = function(...){
  #     tibble(
  #       __
  #     ) %>%
  #       lm(y ~ observed_x, data = .) %>%
  #       broom::tidy() %>%
  #       select(estimate) %>%
  #       slice(2)
  #   }
  # ) %>%
  #   ggplot(aes(x = estimate)) +
  #   geom_density(color = "forestgreen", fill = "forestgreen", alpha = .5) +
  #   geom_vline(xintercept = 2)

  #@09


  # 10. What if the researcher had access to 'x' instead of 'x_observed'?
  # Run the simulation from 9) using y ~ x to see if the bias disappears.

  #10@

  # map_dfr(
  #   .x = __,
  #   .f = function(...){
  #     tibble(
  #       __
  #     ) %>%
  #       lm(__, data = .) %>%
  #       broom::tidy() %>%
  #       select(estimate) %>%
  #       slice(2)
  #   }
  # ) %>%
  #   ggplot(__) +
  #   geom_density(color = "forestgreen", fill = "forestgreen", alpha = .5) +
  #   geom_vline(xintercept = 2)

  #@10

  #-------------------------------------------------------------------------

  # Great work! You're one step closer to tidyverse enlightenment.
  # Make sure to return to this topic to meditate on it later.

  # If you're ready, you can move on to the next koan: lag.
}
