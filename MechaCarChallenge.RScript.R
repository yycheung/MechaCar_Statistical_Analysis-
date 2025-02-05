library(dplyr)
library(tidyverse)

# import MechaCar data
MechaCar_df <- read_csv(file = "Resources/data/MechaCar_mpg.csv")
MechaCar_df

# perform linear reqression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df)

# determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df))

# import Suspension_Coil data
Suspension_Coil_df <- read_csv(file = "Resources/data/Suspension_Coil.csv")
Suspension_Coil_df

# creates a total_summary dataframe
total_summary <- Suspension_Coil_df %>% summarize(Mean_PSI = mean(PSI),
                                                  Median_PSI = median(PSI),
                                                  Variance_PSI = var(PSI),
                                                  SD_PSI = sd(PSI),
                                                  .groups = 'keep' )
total_summary 

# creates a lot_summary dataframe
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean_lot = mean(PSI),
                                                                                Median_lot = median(PSI),
                                                                                Variance_lot = var(PSI),
                                                                                SD_lot = sd(PSI),
                                                                                .groups = 'keep')
lot_summary 

#box plot: PSI each Lot
plt_lot <- ggplot(Suspension_Coil_df,aes(x=Manufacturing_Lot,y=PSI)) 
plt_lot + geom_boxplot()


# use t.test() to determine if the PSI across all manufacturing lots 
# is statistically different from the population mean of 1,500 PSI
t.test(Suspension_Coil_df$PSI,mu=1500)


# t.test on individual lot
lot1 <- subset(Suspension_Coil_df, Manufacturing_Lot=="Lot1")
lot2 <- subset(Suspension_Coil_df, Manufacturing_Lot=="Lot2")
lot3 <- subset(Suspension_Coil_df, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
