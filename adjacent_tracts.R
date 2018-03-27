#Adjacent tracts for sales scrapping
library(dplyr)
library(rgdal)
library(tmap)
library(ggplot2)
library(rgeos)
library(spdep)

tracts  <- readOGR(dsn = "nyct2000",
                   layer = "nyct2000")

adj     <- poly2nb(tracts)
tractdf <- tracts@data
tractdf$CTLabel <- as.character(tractdf$CTLabel)
adj_tracts <- data.frame()

for(tract in 1:length(adj)){
  row      <- 1
  tractnum <-  tractdf[tract, 1]
  borough  <-  tractdf[tract, 2]

  list <- paste('list <- as.list(', as.character(adj[tract]), ')', sep = "")
  eval(parse(text = list))
  
  for(i in 1:length(list)){
    rownum       <- list[[i]]
    if(rownum != 0){
      tractnum2  <- tractdf[rownum, 1] 
      boronum    <- tractdf[rownum, 2]
      adj_tracts <- rbind(adj_tracts, t(as.data.frame(c(tractnum, tractnum2, boronum))))
      row = row + 1
    }
  }
}

colnames(adj_tracts) <- c('Tract', 'Neighbor', 'Borough')

write.csv(adj_tracts, 'adj_tracts.csv')
