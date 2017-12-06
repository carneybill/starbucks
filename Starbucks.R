library(tidyverse)
library(leaflet)

file <- "https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv"
starbucks <- read_csv(file)

nyc <- starbucks %>%
  filter(City == "New York") %>%
  select(Brand, Name, Latitude, Longitude)

leaflet() %>% addTiles() %>% setView(-73.983, 40.760, zoom = 14) %>% 
  addMarkers(data = nyc, lat = ~ Latitude, lng = ~ Longitude, icon = , popup = nyc$Name)

head(nyc)
