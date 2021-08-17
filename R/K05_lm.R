#-------------------------------------------------------------------------
#            Intro to the Tidyverse by Colleen O'Briant
#-------------------------------------------------------------------------

# In order to progress:
# 1. Read all instructions carefully.
# 2. When you come to an exercise, fill in the blank and remove the hashtag
#    (Ctrl/Cmd Shift C) to execute the code in the console (Ctrl/Cmd Return).
#    If the piece of code spans multiple lines, highlight the whole chunk
#    or simply put your cursor at the end of the last line.
# 3. Test that your answers are correct (Ctrl/Cmd Shift T)

#-------------------------------------------------------------------------

# Run this code to get started:

library(tidyverse)
# data source: http://wiki.stat.ucla.edu/socr/index.php/SOCR_Data_MLB_HeightsWeights
mlb <- read_csv("~/Downloads/mlb.csv") %>%
  select(name = Name, team = Team, position = Position,
         height = `Height(inches)`, weight = `Weight(pounds)`, age = Age)

#-------------------------------------------------------------------------

#                          OLS in R: 'lm()'

# Simple regression: an extra inch of height predicts the player is 4.84
# pounds heavier.

lm(weight ~ height, data = mlb) %>%
  broom::tidy(conf.int = TRUE)

lm(weight ~ height, data = mlb) %>%
  broom::glance()

# Visualize the relationship using qplot:

qplot(
  x = height,
  y = weight,
  data = mlb,
  geom = c("point", "smooth")
)

# Multiple regression: holding height constant, an extra year older
# can be associated with the player being .965 pounds heaver.

lm(weight ~ height + age, data = mlb) %>%
  broom::tidy(conf.int = TRUE)

lm(weight ~ height + age, data = mlb) %>%
  broom::glance()


# OLS with factors: are catchers the heaviest players?

lm(weight ~ height + age + position, data = mlb) %>%
  broom::tidy(conf.int = TRUE)

# Wait, where are catchers? Catchers ended up being the "reference"
# level of the factor variable. If you include all levels of 'position',
# you fall into the dummy variable trap. So R automatically omits one
# level, but another solution is to omit the intercept:

lm(weight ~ 0 + height + age + position, data = mlb) %>%
  broom::tidy(conf.int = TRUE)

lm(weight ~ 0 + height + age + position, data = mlb) %>%
  broom::glance()

qplot(
  data = mlb,
  x = height,
  y = weight,
  geom = c("point", "smooth"),
  color = age,
  facets = ~ position
)

# transformations

# log
lm(log(weight) ~ log(height) + log(age) + position, data = mlb) %>%
  broom::tidy(conf.int = TRUE)

# squared
lm(weight ~ height + age + I(age^2) + position, data = mlb) %>%
  broom::tidy(conf.int = TRUE)

# interaction
lm(weight ~ height + age*position, data = mlb) %>%
  broom::tidy(conf.int = TRUE)


# fitted values and residuals
lm(weight ~ height + age + I(age^2) + position, data = mlb) %>%
  fitted.values()

lm(weight ~ height + age + I(age^2) + position, data = mlb) %>%
  residuals()

# Frisch-Waugh-Lovell theorem for visualizing multiple regression
# relationships:

mlb %>%
  mutate(age_tilde = residuals(lm(age ~ height + position, data = mlb))) %>%
  qplot(
    x = age_tilde,
    y = weight,
    data = .,
    geom = c("point", "smooth")
  )

qplot(
  x = age,
  y = weight,
  data = mlb,
  geom = c("point", "smooth")
)

# Are there old MLB teams? Are there tall MLB teams? Are there fat MLB teams?

# FLA is the old team
lm(age ~ height + weight + position + team, data = mlb) %>%
  broom::tidy(conf.int = TRUE) %>%
  filter(p.value < .05)

# there are no tall teams (or short teams)
lm(height ~ age + weight + position + team, data = mlb) %>%
  broom::tidy(conf.int = TRUE) %>%
  filter(p.value < .05)

# there are no fat (or skinny) teams
lm(weight ~ age + height + position + team, data = mlb) %>%
  broom::tidy(conf.int = TRUE) %>%
  filter(p.value < .05)

# are there fat positions?
lm(weight ~ age + height + position, data = mlb) %>%
  broom::tidy(conf.int = TRUE) %>%
  filter(p.value < .05)

mlb %>%
  group_by(position) %>%
  summarize(
    wt_mean = mean(weight, na.rm = TRUE),
    wt_sd   = sd(weight, na.rm = TRUE),
    n = n()
    ) %>%
  arrange(wt_mean)
