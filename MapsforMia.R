
countries <- read.delim("https://raw.githubusercontent.com/seaneff/data-science-basics-2023/main/day3/demo/datasets/countries.tsv")
library(ggplot2)
library(dplyr)

library(readxl)
MiaMaps <- read_excel("MiaDataMaps.xls")

world <- map_data("world")
world_data <- inner_join(world, MiaMaps, by = join_by(region == Country))

MisMap <- (ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
             coord_fixed(1.3) +
             geom_polygon(aes(fill = Status)) +
             ggtitle("Mis and Disinformation Law Presence, by Country") +
             scale_fill_manual(labels = c("Absent", "No data", "Present"), values = c("#577283", "#e9f2f7", "#91bfdb")) +
             labs(fill = "Status") +
             theme(
               legend.position = "bottom",
               axis.text = element_blank(),
               axis.line = element_blank(),
               axis.ticks = element_blank(),
               panel.border = element_blank(),
               panel.grid = element_blank(),
               axis.title = element_blank(),
               panel.background = element_rect(fill= "white"),
               plot.title = element_text(hjust = 0.5)))
print(MisMap)


ConMap <- (ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
             coord_fixed(1.3) +
             geom_polygon(aes(fill = Control)) +
             ggtitle("Regulation of Media Content, by Country") +
             scale_fill_manual(labels = c("Require Public Benefit Content", "During Emergencies", "No Data", "State Run Media"), values = c("#577283", "#91bfdb", "#e9f2f7", "#000000")) +
             labs(fill = "Control Over Media Outlets") +
             theme(
               legend.position = "bottom",
               axis.text = element_blank(),
               axis.line = element_blank(),
               axis.ticks = element_blank(),
               panel.border = element_blank(),
               panel.grid = element_blank(),
               axis.title = element_blank(),
               panel.background = element_rect(fill= "white"),
               plot.title = element_text(hjust = 0.5)))
print(ConMap)

AlertMap <- (ggplot(data = world_data, mapping = aes(x = long, y = lat, group = group)) + 
             coord_fixed(1.3) +
             geom_polygon(aes(fill = Alert)) +
             ggtitle("Public Alert System Legislation, by Country") +
             scale_fill_manual(labels = c("Absent", "No data", "Present"), values = c("#577283", "#e9f2f7", "#91bfdb")) +
               labs(fill = element_blank()) +
               theme(
               legend.position = "bottom",
               axis.text = element_blank(),
               axis.line = element_blank(),
               axis.ticks = element_blank(),
               panel.border = element_blank(),
               panel.grid = element_blank(),
               axis.title = element_blank(),
               panel.background = element_rect(fill= "white"),
               plot.title = element_text(hjust = 0.5)))
print(AlertMap)

