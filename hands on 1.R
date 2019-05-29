library(eurostat)
duomenys <- get_eurostat("namq_10_gdp", stringsAsFactors = FALSE)

library(dplyr)
duomenys_apdorotos <- duomenys %>%
filter(geo == "LT"|
       geo == "LV"|
       geo == "EE",
       time >= "2004-01-01",
       na_item == "B1GQ",
       s_adj == "SCA",
       unit == "CLV_I10"
       )

library(ggplot2)

ggplot(duomenys_apdorotos, aes(time, values, col=geo))+
geom_line()+
scale_x_date(date_labels = "%Y", date_breaks = "1 year")+
theme (axis.text.x = element_text(angle = 45, hjust = 1))+
labs(title = "Real GDP in Lithuania, Latvia and Estonia, index 2010=100",
     subtitle = "Source: Eurostat (namq_10_gdp)",
x="Time",
y="Index")

