# libraries
library("dplyr")

MechaCar_df <- read.csv(file='./Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) #read MechaCar_mpg.csv
Suspension_Coil_df <- read.csv(file='./Resources/Suspension_Coil.csv', check.names = F, stringsAsFactors = F) #read Suspension_Coil.csv

# D1 - multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df)) #generate summary statistics

#D2 Visualizations for Trip Analysis

total_summary <- Suspension_Coil_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups = 'keep')                        
