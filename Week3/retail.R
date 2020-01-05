
# About: We want to analyze which items across a retail data set are more likely to be purchased together. For this, we'll explore the retail.csv file which, though might give us insight into items purchased as a whole, will not give us an idea towards customer preference as we do not know what items they are purchasing. 
# Load required packages
require(pacman)
p_load(arules, arulesViz)
#```

## Loading the data 
#We will use the arules and arulesViz package to get a better idea as to which group of items generate the highest lift and confidence. 

# Now to the same with the retail.csv file
retail <- read.transactions('C:/Users/Administrator/Documents/MSDatascience/IST707/Week3/retail.csv', format = 'basket', sep = ',')


itemFrequencyPlot(retail, topN = 20, type = 'absolute')


## Initial analysis
#We can see from the previous plot that the most frequently purchased items are items 39 and 48. After those two items, items 38, 32, and 41 were the most frequently bought, though at a much more reduced rate. 

## Getting the most common three-item rules. 
#Setting support to 0.001, confidence to at least 0.80, and max length of baskets to three items, we'll explore those baskets with first a high lift followed by high confidence. 

rules <- apriori(retail, parameter = list(supp = 0.001, conf = 0.8, maxlen = 3))
rules <- sort(rules, decreasing = TRUE, by = c('lift', 'confidence'))
inspect(rules[1:5])

#We can see that items 1819, 795, 3311, and 1818 are closely related as a combination of these three items are three of the top baskets with both a high lift and confidence - though their count is not among the highest. 

#To finalize, we'll take a look at these rules visually. We'll limit this graph to the top 5 rules. 
plot(rules[1:5], method = 'graph')
