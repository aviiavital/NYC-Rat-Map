library(shiny)
library(leaflet)
library(dplyr)
library(plotly)
library(googleVis)
library(DT)


rats = read.csv('./NYC_Rodent_Data/rats.csv', stringsAsFactors = F)
rats = rats %>% mutate(INSPECTION_DATE = as.Date(INSPECTION_DATE))
rats_sep = separate(rats, INSPECTION_DATE, '-',into = c('Year','Month','Day'), remove = F)
rats_sep

All_rats = read.csv('./NYC_Rodent_Data/All_rats.csv', stringsAsFactors = F)
All_rats = All_rats %>% mutate(INSPECTION_DATE = as.Date(INSPECTION_DATE))
All_rats = separate(All_rats, INSPECTION_DATE, '-',into = c('Year','Month','Day'), remove = F)
All_rats
