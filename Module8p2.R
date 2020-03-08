data <- read.csv("onlineretailI20092010.csv", header = TRUE, sep=",")

#Data Frame

country_data<-data.frame(
		country=(data$Country),
		qty=(data$Quantity)
		)
#Summary of Data
library(dplyr)

group_by(country_data, country) %>%

  summarise(

    count = n(),

    mean = mean(qty, na.rm = TRUE),

    sd = sd(qty, na.rm = TRUE)

  )

summary(data$Quantity)

#ANOVA Test
res.aov <- aov(qty ~ country, data = data)
# Summary of the analysis
summary(res.aov)
TukeyHSD(res.aov)
