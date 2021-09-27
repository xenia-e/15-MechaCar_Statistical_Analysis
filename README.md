# 15-MechaCar_Statistical_Analysis
statistical analysis using R

# Purpouse

The purpose of this analysis is to review the production data for insights that may help the manufacturing team.

## Methods 
Using **R** programming language.
- Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
- Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
- Run t-tests to determine if the manufacturing lots are statistically different from the mean population
- Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, write a summary interpretation of the findings.
### Deliverables

__Deliverable 1:__ Linear Regression to Predict MPG

__Deliverable 2:__ Summary Statistics on Suspension Coils

__Deliverable 3:__ T-Test on Suspension Coils

__Deliverable 4:__ Design a Study Comparing the MechaCar to the Competition

### Resourses

- MechaCar MPG dataset.

- Suspension Coil dataset.


# Results

## Linear Regression to Predict MPG


We assumed a significance level of 0.05% is sufficient for the current analysis.

We used the following function of multiple linear regression to predicts the mpg of MechaCar prototypes using several variables from the MechaCar_mpg.csv file and summary() function to generate statistics

```
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
 ground_clearance + AWD, data = MechaCar_df)
```
```
Coefficients:
 Estimate Std. Error t value Pr(>|t|) 
(Intercept) -1.040e+02 1.585e+01 -6.559 5.08e-08 ***
vehicle_length 6.267e+00 6.553e-01 9.563 2.60e-12 ***
vehicle_weight 1.245e-03 6.890e-04 1.807 0.0776 . 
spoiler_angle 6.877e-02 6.653e-02 1.034 0.3069 
ground_clearance 3.546e+00 5.412e-01 6.551 5.21e-08 ***
AWD -3.411e+00 2.535e+00 -1.346 0.1852 
---
Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared: 0.7149, Adjusted R-squared: 0.6825 
F-statistic: 22.07 on 5 and 44 DF, p-value: 5.35e-11

```

According to our results, __vehicle length, weight, and ground clearance__ (as well as intercept) are statistically unlikely to provide random amounts of variance to the linear model. In other words, the vehicle length, weight, and ground clearance have a significant impact on miles per gallon performance.

From our linear regression model, the r-squared value is 0.71, which means that roughly __71% of the variability of our dependent variable (miles per gallon prediction) is explained using this linear model__.

In addition, the p-value of our linear regression analysis is 5.35e-11, which is much smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that __the slope of our linear model is not zero__.

## Summary Statistics on Suspension Coils

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. The current manufacturing data meet this design specification for all manufacturing lots in total according to our calculations (see Figure 1)

![mean, median, variance, and standard deviation of the suspension coil’s PSI total ](https://github.com/xenia-e/15-MechaCar_Statistical_Analysis/blob/main/Analysis/total_summary.png)
>Figure 1

But further analysis of each lot individually shows that lot3 doesn't meet the design specifications requirements with its variance of 170.28. (See Figure 2)

![mean, median, variance, and standard deviation of the suspension coil’s PSI by lot ](https://github.com/xenia-e/15-MechaCar_Statistical_Analysis/blob/main/Analysis/lot_summary.png)
>Figure 2. 

## T-Tests on Suspension Coils

We performed t-tests to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.

Null Hypothesis: There is no significant difference between the mean PSI of all manufacturing lots and individual lots and the population mean of 1500 PSI.

Assuming our significance level was the common 0.05 percent, our p-value for all manufacturing lots is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.

```
t.test(Suspension_Coil_df$PSI, mu=1500) #NUll mu=1500

 One Sample t-test

data: Suspension_Coil_df$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 1498.78 
```
The same is true for Manufacturing lot 1 and lot 2 with p-values equal 1 and 0.6 respectively

As for manufacturing lot 3, its p-value is below significance level (p-value = 0.04168), which give us sufficient evidence to reject the null hypothesis and conclude that two means a statistically different

```
t.test(subset(Suspension_Coil_df$PSI, Suspension_Coil_df$Manufacturing_Lot=="Lot3"), mu=1500) #NUll mu=1500

 One Sample t-test

data: subset(Suspension_Coil_df$PSI, Suspension_Coil_df$Manufacturing_Lot == "Lot3")
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
 1496.14 
```

## Study Design: MechaCar vs Competition

If we would like to perform a formal statistical study that can quantify how our company performs against the competition these are the steps I recommend implementing, assuming we have a similar car type (sedan, van, etc.) and the significance value defined for our study is 0.05.

1. Define metrics that are important for consumers when evaluating cars. For example price, city or highway fuel efficiency, horsepower, maintenance cost, safety rating, green score, transmission type, size of trank. 

2. To obtain data needed to perform the analysis we should design a survey and ask participants to rate each metric.

3. Test hypothesis: Is there a difference in frequency between a participant selecting MechaCar vs Competition? We will perform a Chi-squared test to compare the distribution of frequencies across two groups (MechaCar vs Competition) to test our hypothesis. With the p-value and the interval of confidence, we will reject or accept the hypothesis.


4. Perform statistical analysis on most valuable metrics, e.g. horsepower, city, and highway fuel efficiency and price. 

      4.1. To perform the analysis, we are collecting target data for all MechaCar competitors.

      4.2. For each metric hypothesizes will be:

      H0: There is _no difference_ in frequency distribution between participants preferring MechaCar vs Competition.
      
      Ha: There _is a difference_ in frequency distribution between participants preferring MechaCar vs Competition.

      4.3. Then we would perform t-tests on each metric for MechaCar against the same metric from the competition data.

      4.4. If the p-value for each t-test is less than 0.05 then we will reject our NULL hypothesis.


