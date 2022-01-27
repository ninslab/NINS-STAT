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
# Add Inputs from Matlab to R
#--------------------------------------------------
args <- commandArgs(trailingOnly = TRUE)
print(args)

# Check if useer already has library -> download and install if required
packages <- c("rJava","xlsx","cutpointr","R.matlab","pROC")

## Now load or install
# not_installed <- my_packages[!(my_packages %in% installed.packages()[ , "Package"])]                  # Extract not installed packages
# if(length(not_installed)) install.packages(not_installed, repos='https://cloud.r-project.org')        # Install not installed packages

package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE, repos='https://cloud.r-project.org')
      # library(x, character.only = TRUE)
    }
  }
)

# Library Files
library("xlsx") # For reading Excel (.xlsx)
library("cutpointr") # For Identifying cutpoint in ROC and other values
library("R.matlab") # To read .mat files generated from Matlab
library('pROC') # Plot ROC (Singular and Multiple)

# Dedicate Inputs
filename <- args[1]
data_class <- args[2]
data_pos <- args[3]

roc_cont_val = readMat('cont_r_roc.mat') # Read .mat value for column number for predictor variables
roc_cont_num <- roc_cont_val$var.cont # Isolate the values

# Process Inputs
d_class <- as.numeric(data_class) # Ensure the value is in numeric format
d_poscl <- as.numeric(data_pos) # Ensure the value is in numeric format
dat <- read.xlsx(filename, 1) # Read Excel sheet
lenROC <- length(roc_cont_num) # Count the number of continuous variables
colname_val <- colnames(dat) # Isolate the column names only for labeling purposes

# Add NA in place of blank areas
dat[dat == "" | dat == " "] <- NA

# Find unique numbers
uniNum <- unique(dat[, d_class])
len <- length(uniNum)

for (i in 1:len) {
  primNum = uniNum[i]
  if (primNum != d_poscl){
    d_negcl = primNum
  }
}

# Change the data frame - remove rows with NA in them
dataNew <- data.frame(dat[,d_class], dat[,roc_cont_num])
colnames(dataNew) <- c(colname_val[d_class], colname_val[roc_cont_num])
dataChanges <- na.omit(dataNew)

# Iterate and print ROC table and plot ROC
for (i in 1:lenROC) {
  
  # Print Text and Labels -  Status and Predictor Variables
  str_display_cp <- paste("Class Variable - ", colname_val[d_class],"& Predictor Variable -",colname_val[roc_cont_num[i]])
  print("-----------------------------------------------------------------------------------------------------------------")
  print(str_display_cp)
  print("-----------------------------------------------------------------------------------------------------------------")
  
  op <- par(cex = 1.5)

  # Plot ROC - Single predictor vs class plots
  pROC::roc(as.numeric(dataChanges[,1]), as.numeric(dataChanges[,(i+1)]), levels = c(d_negcl,d_poscl), plot = TRUE, grid = TRUE, show.thres = TRUE, col=1, legacy.axes=TRUE)
  legend(x = "bottomright", title = "Index", legend = c(colname_val[roc_cont_num[i]]),cex = 0.8, lty = c(1), col = c(1:lenROC), lwd = 2)

  # Print ROC table with summary of values
  cp <- cutpointr(as.numeric(dataChanges[,(i+1)]), as.numeric(dataChanges[,1]) , pos_class= d_poscl, method = maximize_metric, metric = youden, na.rm = TRUE)
  print(summary(cp))
}

# Plot multiple ROC in case of multiple predictor variables
if (lenROC > 1) {
  pROC::roc(as.numeric(dataChanges[,1]), as.numeric(dataChanges[,2]), levels = c(d_negcl,d_poscl), plot = TRUE, grid = TRUE, show.thres = TRUE, col=1, legacy.axes=TRUE) # Plot the first ROC first so the other ones can be added onto it
  
  for (i in 2:lenROC) {
    # Add other predictors on the same plot
    pROC::roc(as.numeric(dataChanges[,1]), as.numeric(dataChanges[,(i+1)]), levels = c(d_negcl,d_poscl), plot = TRUE, grid = TRUE, show.thres = TRUE, add=TRUE, col=i, legacy.axes=TRUE)
  }
  # Add Legend for all the plots and position on the bottom right portion of the graph
  legend(x = "bottomright", title = "Index", legend = c(colname_val[roc_cont_num]), cex = 0.8, lty = c(1), col = c(1:lenROC), lwd = 2)
}


















