rats = read.csv('rodent-inspection.csv')

library(lubridate)
library(dplyr)
library(tidyr)

rats = rats %>% drop_na()
rats = rats[!grepl("Passed", rats$RESULT),]
rats = rats[!grepl("Monitoring", rats$RESULT),]
rats = rats[!grepl("Problem", rats$RESULT),]
rats = rats[!grepl("Cleanup", rats$RESULT),]
rats = rats[!grepl("Bait", rats$RESULT),]
write.csv(rats,'rats.csv')

rats = read.csv('rats.csv')
rats

rats %>% group_by(.,ZIP_CODE) %>% summarise(.,total.count=n())
ratszip = rats %>% group_by(.,ZIP_CODE) %>% summarise(.,total.count=n())
ratszip
write.csv(ratszip,'ratszip.csv')

ratsborough = rats %>% group_by(.,BOROUGH) %>% summarise(.,total.count=n())
ratsborough
write.csv(ratsborough,'ratsborough.csv')

ratsdate = as.Date(rats$INSPECTION_DATE, format = "%Y-%m-%d")
ratsdate[order(as.Date(ratsdate, format="%d/%m/%Y"))]
ratsdate = table(factor(format(ratsdate,"%Y")))
write.csv(ratsdate,'ratsdate.csv')

ratsdatem = as.Date(rats$INSPECTION_DATE, format = "%Y-%m-%d")
ratsdatem[order(as.Date(ratsdatem, format="%d/%m/%Y"))]
ratsdatem = table(factor(format(ratsdatem,"%m/%Y")))
write.csv(ratsdatem,'ratsdatem.csv')

read.csv('ratsdatem.csv')
read.csv('ratsborough.csv')
read.csv('ratszip.csv')
read.csv('ratslocation.csv')





