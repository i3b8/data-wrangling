filename <- "murders.csv"
dir <- system.file("extdata", package = "dslabs") 
fullpath <- file.path(dir, filename)
file.copy(fullpath, "murders.csv")

system.file("extdata",package="dslabs")

path <-system.file("extdata",package ="dslabs")
list.files(path)

filename <-"murders.csv"
fullpath <- file.path(path,filename)
fullpath
file.copy(fullpath,getwd())
file.exists((filename))

##The readr and readxl Packages 
library(tidyverse)
read_lines("murders.csv",n_max =3)
dat <- read_csv(filename)
dat <-read_csv(fullpath)

#Importing Data Using R-base Functions
filename <- "murders.csv"
dat2 <-read.csv(filename)
class(dat2)

#Downloading Files from the Internet

url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"
dat <- read_csv(url)
#local copy of the file 
download.file(url,"murders.csv")

##creating temporary names 
tmp_filename <-tempfile()
download.file(url,tmp_filename)
dat<-read_csv(tmp_filename)
file.remove(tmp_filename)
