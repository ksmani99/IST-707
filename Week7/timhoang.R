--
  
  title: "Untitled"

author: "Tin Hoang"

date: "11/13/2019"

output: html_document

---
  
  ```{r setup, include=FALSE}

knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)

```

## Read Data

```{r}

library(tidyverse)

train_sample <- read_csv("/Users/tinhoang/Desktop/Teaching @ SU/IST 707/Data/digit_train_sample_small.csv")

test_sample <- read_csv("/Users/tinhoang/Desktop/Teaching @ SU/IST 707/Data/digit_test_sample_small.csv")

head(train_sample)

head(test_sample)

train_sample$label <- as.factor(train_sample$label)

```

## Pre-process Data

[Link to preProcess in caret] https://www.rdocumentation.org/packages/caret/versions/6.0-84/topics/preProcess

```{r}

# utilize near zero variance and range methods in caret to remove and normalize variables

library(caret)

preProc <- preProcess(train_sample, method = c("nzv", "range"))

train_new <- predict(preProc, train_sample)

test_new <- predict(preProc, test_sample)

head(train_new)

head(test_new)

# utilize discretize in arules to convert nummeric to categorical

train_new <- train_new %>% 
  
  #mutate_all(~arules::discretize(., method = "interval", breaks = 10))
  
  mutate_if(is.numeric, ~arules::discretize(., method = "interval", breaks = 10))

test_new <- test_new %>% 
  
  mutate_if(is.numeric, ~arules::discretize(., method = "interval", breaks = 10))

head(train_new)

head(test_new)

```

## Further split the train data into a train set and a validation set

```{r}

train_index <- createDataPartition(train_new$label, p = 0.8, list = FALSE)

# bring the label back before splitting

#train_new$label <- Y_train

train_set <- train_new[train_index, ]

validate_set <- train_new[-train_index, ]

```

```{r}

library(e1071)

nb_model <- naiveBayes(label ~., data = train_set)

# predict on validation set

pred <- predict(nb_model, newdata = validate_set, type = c("class"))

caret::confusionMatrix(pred, validate_set$label)

```

```{r}

predict(nb_model, newdata = test_new[,-1], type = "class")

```

## Model with Cross Validation using Caret

```{r}

library(caret)

set.seed(724)

# use 10-fold cross validation

train_control <- trainControl(method = "cv",
                              
                              number = 5)

# for some reasons naive bayes in caret with the klaR package

# does not like using the formular label ~., data = train_set

# separating the explanatory variables & interest variable out 

# and the model will work just fine

nb_model2 <- train(train_set[ ,-1], # matrix of explanatory variables only
                   
                   train_set$label, # variable on interest only
                   
                   method = "nb",        # implementation of the klaR package
                   
                   trControl = train_control)

nb_model2

```

```{r}

# predict on validation set

pred2 <- predict(nb_model2, newdata = validate_set[,-1], type = c("raw"))

caret::confusionMatrix(pred2, validate_set$label)

```