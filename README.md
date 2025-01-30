# 🏗️ Life Expectancy Data Analysis  

## 📜 Overview  
This project analyzes **factors affecting life expectancy** using **WHO data (2000-2015)**. The dataset consists of **2,938 observations and 22 variables** covering **global health, economic, and demographic indicators**. The primary objective is to identify **key determinants** of life expectancy and build **predictive models** for analysis.  

## 🎯 Problem Explanation  
Life expectancy is a critical measure of a country's overall health and development. This analysis aims to:  

1. **Explore correlations** between life expectancy and factors like **GDP, schooling, healthcare expenditure, and mortality rates**.  
2. **Compare life expectancy** between **developed and developing countries**.  
3. **Perform logistic regression** to classify countries as **developed (1) or developing (0)** based on socioeconomic and health factors.  

### **Dataset Features:**  
- **Target Variable:**  
  - `Life Expectancy`: Average lifespan of a country's citizens (in years).  
- **Independent Variables:**  
  - `Country`, `Year`, `Status` (Developed/Developing)  
  - **Health Factors**: Infant Mortality, BMI, Alcohol Consumption, HIV/AIDS Deaths  
  - **Economic Factors**: GDP per Capita, Government Health Expenditure (%)  
  - **Demographic Factors**: Population, Schooling, Immunization Coverage (Hepatitis B, Polio)  

## 🛠️ Implementation Details  
1. **Data Cleaning & Handling Missing Values:**  
   - Missing GDP values were **extrapolated** using linear interpolation.  
   - Median imputation was applied for missing **health statistics**.  
   - `Democratic People's Republic of Korea` was removed due to missing population & GDP data.  

2. **Exploratory Data Analysis (EDA):**  
   - Visualized **distribution of life expectancy** by country status (boxplots & density plots).  
   - Analyzed **correlations** (VIF test) to detect multicollinearity.  
   - Applied **log transformation** to normalize population distribution.  

3. **Predictive Modeling:**  
   - **Logistic Regression:** Classifies countries as `Developed (1)` or `Developing (0)`.  
   - **Feature Selection:** Removed highly correlated variables to improve model performance.  
   - **Train-Test Split (70-30)**: Ensured balanced class distribution.  

## 🚀 Technologies Used  
- **R** (for statistical modeling & visualization).  
- **Tidyverse (dplyr, ggplot2)** (for data wrangling & visualization).  
- **Caret & glmnet** (for logistic regression & feature selection).  
