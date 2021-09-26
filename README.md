# 15-MechaCar_Statistical_Analysis
statistical analysis using R


### Deliverables

Deliverable 1: Linear Regression to Predict MPG
Deliverable 2: Summary Statistics on Suspension Coils
Deliverable 3: T-Test on Suspension Coils
Deliverable 4: Design a Study Comparing the MechaCar to the Competition

### Resourses

MechaCar MPG dataset (Links to an external site.).
Suspension Coil dataset (Links to an external site.).


#Results

## Linear Regression to Predict MPG


We dassumed significance level of 0.05% is sufficiant for current analysis.

We used folllowing function of multiple linear regression to predicts the mpg of MechaCar prototypes using several variables from the MechaCar_mpg.csv fileand summary() function to generate statiscs

```
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechaCar_df)
```
```
Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

```

According to our results, __vehicle length, weight and ground clearance__ (as well as intercept) are statistically unlikely to provide random amounts of variance to the linear model. In other words the vehicle length, weight and ground clearance have a significant impact on miles per gallon performance.

From our linear regression model, the r-squared value is 0.71, which means that roughly __71% of the variablilty of our dependent variable (miles per gallon prediction) is explained using this linear model__.

In addition, the p-value of our linear regression analysis is 5.35e-11, which is much smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that __the slope of our linear model is not zero__.

## Summary Statistics on Suspension Coils

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. The current manufacturing data meet this design specification for all manufacturing lots in total according to our calculations (see Figure 1)

![mean, median, variance, and standard deviation of the suspension coil’s PSI total ]()
>Figure 1

But further analysis of each lot indivualy shows that lot3 doesn't meet the design specifications requirements with it's variance of 170.28. (See Figure 2)

![mean, median, variance, and standard deviation of the suspension coil’s PSI by lot ]()
>Figure 2. 