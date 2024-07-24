# Jul 24 R Workshop 
# BEB

library(googlesheets4)
library(ggplot2)
# ggsci has color palettes for popular journals, as well as a few movies, shows etc
library(ggsci)
gs4_deauth()

sheet='https://docs.google.com/spreadsheets/d/1ttWfRVH5iyyZOFYSU0syy5luj5IRlbYjUIMC8jbcf2I/edit?usp=sharing'
col_typres='cnniininnnnnnccc'
range='data'

corals=read_sheet(sheet,col_types,range,na="NA")
meta=read_sheet(sheet,range='meta')
cite=read_sheet(sheet,range='citation')
str(corals)
corals$treatment_year=as.factor(corals$treatment_year)

corals %>%
  ggplot(aes(x=calcification,y=count_endosymbiont))+
  geom_smooth(method='lm')+
  geom_point(aes(col=treatment_year,pch=treatment_year))+
  scale_color_aaas()+
  facet_wrap(~species)+
  theme_bw()
