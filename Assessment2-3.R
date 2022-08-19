library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

nodes <- html_nodes(h, "table")
html_text(nodes[[8]])

html_table(nodes[[8]])

table_1 <- html_table(nodes[[1]])
table_1

table_2 <-html_table(nodes[[2]])
table_2

table_3 <-html_table(nodes[[3]])
table_3

table_4 <-html_table(nodes[[4]])
table_4

tab_1<-html_table(nodes[[10]]) %>% select(X2,X3,X4)
tab_2 <- html_table(nodes[[19]])
colnames(tab_1) <- c("Team", "Payroll", "Average")
colnames(tab_2) <- c("Team", "Payroll", "Average")
nrow(full_join(tab_1,tab_2,by="Team"))


tab_1 <- html_table(nodes[[10]])
tab_2 <- html_table(nodes[[19]])
col_names <- c("Team", "Payroll", "Average")
tab_1 <- tab_1[-1, -1]
tab_2 <- tab_2[-1,]
names(tab_2) <- col_names
names(tab_1) <- col_names
full_join(tab_1,tab_2, by = "Team")


library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h <-read_html(url)
tab <-html_nodes(h, "table")
tab
length(tab)
## inspection 
html_table(tab,fill=TRUE)
