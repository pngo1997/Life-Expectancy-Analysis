# Jenish Dobariya
# WHO life expectancy data analysis

# URL for data: 

# Setting the directory
setwd("C:/Users/maimu/OneDrive/Documents/DePaul/DSC 424")

# Loading necessary libraries
library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(foreign)
library(CCA)
library(yacca)
library(MASS)
library(vcd)
library(ca)
library(dplyr)

# Reading in the updated dataset
updated_data <- read.csv(file="Life Expectancy Data.csv", header=TRUE, sep=",")

#####################################
# Getting some information on the data
head(updated_data)

tail(updated_data)

# Using the describe function 
# Checking for any nulls
sum(is.na(updated_data))
# 0 NUll values

#################################
# Selected interested columns

interest_col <- updated_data %>%
  filter(Year == 2015) %>%
  select(Life.expectancy, BMI, Status)

head(interest_col)

# Renaming the column from life expectancy
revised_col <- interest_col %>%
  rename(Life_expectancy = Life.expectancy)

# Visualization to check if life expectancy changes with development status
ggplot(revised_col, aes(x = Status, y=Life_expectancy, fill=Status)) + 
  geom_boxplot() + 
  labs(title = "Box Plot of Life expectancy by Development Status", 
       x = "Development Staus",
       y = "Life Expectancy")

# Count plot for BMI with status
ggplot(interest_col, aes(x=Status, fill=BMI)) +geom_bar(position = "dodge")


# Checking code for a reason
BMI_category <- function(bmi){
  if (bmi < 18.5){
    return('Underweight')
  } else if (18.5 <= bmi && bmi < 24.9){
    return('Normalweight')
  } else{return('Overweight')}
}

# Changing BMI for 2015 data
interest_col$BMI <- sapply(interest_col$BMI, BMI_category)

# Changing BMI for 2000 data
interest_col_2000$BMI <- sapply(interest_col_2000$BMI, BMI_category)


# Performing Corresponding analysis for 2015 data.
interest_col$BMI <- factor(interest_col$BMI)
interest_col$Status <- factor(interest_col$Status)

# Converting pivot_table to a contingency table
contingency_table <- table(interest_col$Status, interest_col$BMI)
contingency_table

head(interest_col)

model <- ca(contingency_table)
summary(model)

row_coords <- model$rowcoord
row_coords
