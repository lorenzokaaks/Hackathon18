#Figure 2
library(tidyverse)

A <- read_csv("sample_A.csv")


install.packages("Hmisc")
library(Hmisc)
working_age <- filter(A, working_age == 1)

means <- working_age %>%
  group_by(year, sex) %>%
  filter(!is.na(wage), !is.na(hrs)) %>%
  summarize(avwage = Hmisc::wtd.mean(wage, wgt), 
            avhrs = Hmisc::wtd.mean(hrs, wgt))
means



fig2mwage <- ggplot(data=filter(means,sex==1)) +
  geom_line(mapping = aes(x = year, y = avwage))
fig2mwage

fig2mhrs <- ggplot(data=filter(means,sex==1)) + geom_line(mapping = aes(x = year, y = avhrs))
fig2mhrs

fig2fwage <- ggplot(data = filter(means, sex==2)) + 
  geom_line(aes(x = year, y = avwage))
fig2fwage

fig2fhrs <- ggplot(data=filter(means, sex==2)) + geom_line(aes(x=year, y=avhrs))
fig2fhrs
  

