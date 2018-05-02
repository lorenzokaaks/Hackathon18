library(tidyverse)

B <- read_csv("sample_B.csv")
B

install.packages("Hmsic")
library(Hmsic)



college <- B %>%
  mutate(educated = ifelse(edu >= 16, 1, 0)) %>%
  group_by(year, sex, educated) %>%
  summarize(avwage = weighted.mean(wage, wgt, na.rm = TRUE))
college

college <- spread(college, educated, avwage)
college

college <- mutate(college, collegepremium = `1`/`0`)

fig5_1 <- ggplot(college) + geom_line(aes(x = year, y = collegepremium, color = factor(sex)))
fig5_1

#Experience wage premium
experience <- B %>%
  mutate(experienced = ifelse(age %in% 45:55, 2, ifelse(age %in% 25:35, 1, 0))) %>%
  group_by(year, sex, experienced) %>%
  summarize(avwage = weighted.mean(wage, wgt, na.rm = TRUE))
experience

experience <- spread(experience, experienced, avwage)
experience

experience <- mutate(experience, exppremium = `2`/`1`)
experience

fig5_2 <- ggplot(experience) + geom_line(aes(x = year, y = exppremium, color = factor(sex)))
fig5_2

#Gender wage premium
gender <- B %>%
  group_by(year, sex) %>%
  summarize(avwage = weighted.mean(wage, na.rm = TRUE))
gender

gender <- spread(gender, sex, avwage)
gender

gender <- mutate(gender, genderpremium = `1`/`2`)
gender

fig5_3 <- ggplot(gender) + geom_line(aes(x = year, y = genderpremium))
fig5_3