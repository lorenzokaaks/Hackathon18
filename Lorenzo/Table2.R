setwd("C:/Users/lorenzo/Documents/Master in Economics/Programming Course/R/Hackathon")

#Inserting sample B
B <- read_csv("sample_B.csv", col_types = cols(new_hrs = col_double(), new_wage = col_double()))
B

#Table 2

#Period: 1967-79
B_6779 <- filter(B, year %in% 1968:1980)
B_6779 %>%
  group_by(sex) %>%
  summarize(mean(age))

nmale <- B_6779 %>%
  group_by(sex) %>%
  summarize(nmale = n())

n1male <- B_6779 %>%
  filter(edu > 15) %>%
  group_by(sex) %>%
  summarize(n1male = n())

counts <- left_join(n1male, nmale) %>%
  mutate(percentage = n1male/nmale)

#Period: 1980-1989
B_8089 <- filter(B, year %in% 1981:1990)
B_8089 %>%
  group_by(sex) %>%
  summarize(mean(age))

nmale <- B_8089 %>%
  group_by(sex) %>%
  summarize(nmale = n())

n1male <- B_8089 %>%
  filter(edu > 15) %>%
  group_by(sex) %>%
  summarize(n1male = n())

counts <- left_join(n1male, nmale) %>%
  mutate(percentage = n1male/nmale)
counts 


#Period: 1990-99
B_9099 <- filter(B, year %in% 1991:2000)
B_9099 %>%
  group_by(sex) %>%
  summarize(mean(age))

nmale <- B_9099 %>%
  group_by(sex) %>%
  summarize(nmale = n())

n1male <- B_9099 %>%
  filter(edu > 15) %>%
  group_by(sex) %>%
  summarize(n1male = n())

counts <- left_join(n1male, nmale) %>%
  mutate(percentage = n1male/nmale)
counts

#Period 2000-today
B_0005 <- filter(B, year >= 2001)
B_0005 %>%
  group_by(sex) %>%
  summarize(mean(age))

nmale <- B_0005 %>%
  group_by(sex) %>%
  summarize(nmale = n())

n1male <- B_0005 %>%
  filter(edu > 15) %>%
  group_by(sex) %>%
  summarize(n1male = n())

counts <- left_join(n1male, nmale) %>%
  mutate(percentage = n1male/nmale)
counts








  
  
  
