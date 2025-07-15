# Load required libraries

#install.packages("devtools")
#devtools::install_github("Chicago/RSocrata")
#install.packages("dplyr")
#install.packages("rstudioapi")

#Toturial for a more sophisitcated use of RSocrata
#https://www.route1.io/how-to-connect-to-socrata-data-from-r/#:~:text=To%20start%20with%20we%20will%20need%20to%20download,go%2C%20we%20can%20load%20and%20cleanup%20the%20dataset.

library(RSocrata)
library(dplyr)
library(rstudioapi)


setwd(dirname(getActiveDocumentContext()$path))
getwd()


#Note that this is anonymous access, other APIs have tokens and login info
#Socrata can accomodate tokens and login

# Define Socrata API endpoint and dataset ID
endpoint <- "https://data.cityofnewyork.us/resource/5hjv-bjbv.json" #HUMAN INPUT


# The R version of RSocrata does not limit the number of pulls like 
# the python version so pulling data is a much simpler process.

# Retrieve data from Socrata API
data <- read.socrata(endpoint)

# Convert to a data frame (if needed)
df <- as.data.frame(data)



# Save to CSV
write.csv(df, "../output/ROUTPUT_open_data_nyc_employ_DL_6-26-25.csv", row.names = FALSE)

