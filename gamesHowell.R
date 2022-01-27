# NINS-STAT Graphical User Interface
# start.m function starts the entire
# interface.
#
# Final revision date : 11th August 2021

# Author:
# Dr. Pravat K. Mandal
# Neuroimaging and Neurospectroscopy Lab,
# National Brain Research Centre,
# Manesar, India

#--------------------------------------------------
# Enable Inputs from Matlab to R
#--------------------------------------------------
args <- commandArgs(trailingOnly = TRUE)

# Check if useer already has library -> download and install if required
packages <- c("rstatix")

package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE, repos='https://cloud.r-project.org')
    }
  }
)

# Library Files
library("xlsx") # For reading Excel (.xlsx)
library("rstatix") # For Identifying cutpoint in ROC and other values

# Dedicate Inputs
filename <- args[1]
var_data <- args[2]
var_class <- args[3]

# Read data and fill empty spaces with NA
data <- read.xlsx(filename, 1)
data[data == "" | data == " "] <- NA

# Extract column names and extract column of interest
col <- colnames(data)
col_data <- col[as.numeric(var_data)]
col_class <- col[as.numeric(var_class)]

# Create string for formula as input
strint <- paste(col_data, col_class, sep=" ~ ")

# Apply games howell post hoc analysis
res <- games_howell_test(data=data, as.formula(strint))

# Convert results into a data frame 
tbl <- data.frame(res)

# Print on console
print('-------------------------------------------------')
print('-----------Games Howell Post Hoc Analysis--------')
print('-------------------------------------------------')

print(tbl)




