data("iris")
iris
summary(iris)
head(iris)
str(iris)
library(ggplot2)
library(e1071)

qplot(Petal.Length, Petal.Width, data=iris, color=Species)
qplot(Sepal.Length, Sepal.Width, data=iris, color=Species)

help("svm")
svm_model1 <- svm(Species~., data = iris)
summary(svm_model1)

plot(svm_model1, data = iris, Petal.Width~Petal.Length, slice=list(Sepal.Width = 3, Sepal.Length=4))
pred1 <- predict(svm_model1, iris)

table1 <- table(Predicted = pred1, Actual = iris$Species)
table1

Model1_accuracyRate = sum(diag(table1))/sum(table1)
Model1_accuracyRate
Model1_MissclassificationRate = 1 - Model1_accuracyRate
Model1_MissclassificationRate

svm_model2 <- svm(Species~., data=iris, kernel="linear")
summary(svm_model2)
plot(svm_model2, data=iris, Petal.Width~Petal.Length, slice=list(Sepal.Width = 3, Sepal.Length=4))
pred2 = predict(svm_model2, iris)
table2 <- table(Predicted = pred2, Actual = iris$Species)
table2
