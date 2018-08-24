as#NOT RUN 
library(arules)
library(arulesViz)
library(plotly)


Groceries<-read.transactions("groceries.csv")

data(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
rules

#interactive scatter plot visualization
plotly_arules(rules)
plotly_arules(rules, measure = c("support", "lift"), shading = "confidence")
plotly_arules(rules, method = "two-key plot")

#add jitter, change color and markers and add a title
plotly_arules(rules, jitter = 10, marker = list(opacity = .7, size = 10, symbol = 1), colors = c("blue", "green"))

layout(title = "Some Grocery Rules")


#save a plot as a html page
p <- plotly_arules(rules)
htmlwidgets::saveWidget(p, "arules.html", selfcontained = FALSE)
browseURL("arules.html")
#Note: selfcontained seems to make the browser slow.

#interactive matrix visualization
plotly_arules(rules, method = "matrix") 
layout(title = "Reordered Matrix")
#}
