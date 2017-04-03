clean_my_table <- function(adatom){
comp_list <- adatom
comp_list <- comp_list[,-c(5,8,9), with=F]
comp_list <-comp_list[-grep("\\^",comp_list$Symbol),  ]
comp_list <-comp_list[duplicated(comp_list$Name)==F,]
comp_list[MarketCap=='/a',]$MarketCap <- '0'
comp_list[MarketCap=='n/a',]$MarketCap <- '0'

comp_list$LastSale <- as.numeric(comp_list$LastSale)

#marketcap
for (i in 1:nrow(comp_list)){
  comp_list$MarketCap[i] <- substr(comp_list$MarketCap[i], 2,nchar(comp_list$MarketCap[i]))
}


for (i in 1:nrow(comp_list)){
  if (endsWith(comp_list$MarketCap[i],"B")) {
    comp_list$MarketCap[i] <- as.numeric(substr(comp_list$MarketCap[i], 1,nchar(comp_list$MarketCap[i])-1))
  }
  
  if (endsWith(comp_list$MarketCap[i],"M")) {
    comp_list$MarketCap[i] <- as.numeric(substr(comp_list$MarketCap[i], 1,nchar(comp_list$MarketCap[i])-1))/1000
  }
}


comp_list$MarketCap <- as.numeric(comp_list$MarketCap)

return(comp_list)
}