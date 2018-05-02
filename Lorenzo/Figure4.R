library(tidyverse)

B <- read_csv("sample_B.csv")
B

install.packages("Hmisc")
library(Hmisc)

#Log-hourly wages
wages <- B %>%
  group_by(year, sex) %>%
  filter(!is.na(wage)) %>%
  summarize(wagevar = wtd.var(log(wage), wgt))
wages

fig4m1 <- ggplot(wages) + geom_line(aes(x=year, y = wagevar, color = factor(sex)))
fig4m1

#Gini coefficient
install.packages("reldlist")
library(reldlist)

wagesgini <- B %>%
  group_by(year, sex) %>%
  filter(!is.na(wage)) %>%
  summarize(giniwage = GiniMd(wage))
wagesgini

fig4gini <- ggplot(wagesgini) + geom_line(aes(x = year, y = giniwage, color = factor(sex)))
fig4gini

# P50-P10 Ratio of Hourly Wages
install.packages("reldlist")
library(reldlist)

wagepctile <- B %>%
  group_by(year, sex) %>%
  filter(!is.na(wage)) %>%
  summarize(pctile9 = quantile(wage, .9),
            pctile5 = quantile (wage, .5),
            pctile1 = quantile(wage, .1))
wagepctile

mutate # in order to create new variables with percentile ratios


