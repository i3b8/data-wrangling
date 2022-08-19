library(dplyr)
library(dslabs)
help("left_join")
help("semi_join")
library(Lahman)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()
Master <- select(People, c(playerID, nameFirst, nameLast))

Master %>% as_tibble()
top_names <- top %>%left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)
top_names
Salaries %>% as_tibble()
top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names)%>%
  select(nameFirst, nameLast, teamID, HR, salary)
top_salary
awarded <- AwardsPlayers %>% filter(yearID == 2016) #"%>%right_join(top_names)%>%select(awardID,playerID)

awarded <- awarded %>% group_by(playerID)
awarded_1 <- awarded %>% filter(playerID %in% top_names$playerID)
awarded_1
awarded_2 <-awarded %>% filter(!(playerID %in% top_names$playerID)) %>% group_by(playerID) %>% filter(!duplicated(playerID))
length(awarded_2$playerID)
