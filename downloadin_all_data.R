source("my_functions.R")
library(data.table)

comp_lists = data.table(rbind(read.csv('http://www.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=nasdaq&render=download', stringsAsFactors = F), read.csv('http://www.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=nyse&render=download', stringsAsFactors = F)))

comp_lists <- clean_my_table(comp_lists)

