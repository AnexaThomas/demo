Data<-read.csv("C:/Users/pc/Desktop/R studio/Social_Network_Ads.csv")
Data
summary(Data)
head(Data)
plot(Data)

#Splitting the data into training and test data
install.packages("caTools")
set.seed(200)
library(caTools)
split<-sample.split(Data,SplitRatio=0.7)
head(split)
train<-subset(Data,split="TRUE")
train
test<-subset(Data,split="FALSE")
test

#Create model
Model<-lm(EstimatedSalary ~.,data=train) # lm=linear regression model,profit is the dependent variable ~. means all the independent variables

#prediction
pred<-predict(Model,test)
pred

#Bind a new table with actual and predicted values
final_data<-cbind(Actual=Data$EstimatedSalary, predicted=pred)
View(final_data)

#finding Accuracy
mae<-mean(abs((pred-Data$EstimatedSalary))/Data$EstimatedSalary)
mae

rmse<-sqrt(mean(pred-Data$EstimatedSalary)^2)
rmse