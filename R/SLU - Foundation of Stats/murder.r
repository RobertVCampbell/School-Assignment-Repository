suppressMessages(library(dplyr))
library(dplyrmurdermystery)
data("dplyr_murder_mystery")
library(tidyr)
jan_murd<-crime_scene_report %>% filter(date=="2018-01-15") %>% filter(type=="murder") %>% group_by(date)
rel_report<-jan_murd$description[3]
rel_report
wit_2<-person %>% filter(id==16371)
wit_1<-person %>% filter(address_street_name=="Northwestern Dr") %>% filter(address_number>4000 | address_number<310)
wit_1
wit_2
wit_ids<-drivers_license %>% filter(id == 118009 | id==51009 | id==490173)
wit_1<-wit_1 %>% filter(license_id==118009)
wit_interview<-interview %>% filter(person_id == 14887 | person_id==16371)
