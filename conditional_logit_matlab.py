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

import sys
import pandas as pd
import statsmodels.api as sm
import pylab as pl
import collections
import numpy as np
import statsmodels.base.model as base
import statsmodels.regression.linear_model as lm
import statsmodels.base.wrapper as wrap
from statsmodels.discrete.conditional_models import ConditionalLogit
import scipy.io


direc_val = sys.argv[1]
dependent_val = int(sys.argv[2])
group_val = int(sys.argv[3])

dat_cont = []

# read independent variables from mat file
independent_val = scipy.io.loadmat('roc_independent_var.mat')
independent_val_arr = independent_val["var_independent"]
index_arr = independent_val_arr

# Import Data
df = pd.read_excel(direc_val)
dat_dependent = df.iloc[:, dependent_val]
dat_group = df.iloc[:, group_val]

# Convert to numpy array
dat_dependent_numpy = dat_dependent.to_numpy()
dat_group_numpy = dat_group.to_numpy()

dat_cont = []

# Extract independent variables and add into array
for i in index_arr:
    # dat_cont.append(df.iloc[:, i])
    temp_var = df.iloc[:,i]
    tvar = temp_var.to_numpy()
    dat_cont.append(tvar)

# Convert number of continuous data into a data frame
# df1 = pd.DataFrame(dat_cont)  # Add continuous data into a dataframe
# df_t = df1.T  # Transpose dataframe completely, since we need data into columnar data and not row format
# df_numpy = df_t.to_numpy()  # Converting data into numpy format for further processing
# dat_continuous_numpy = df_numpy  # Final variable (Continuous)

dat_continuous_numpy = dat_cont[0]

# Conditional Logistic Regression

# print(dat_dependent_numpy)
# print(len(dat_continuous_numpy))
# print(dat_group_numpy)


cp = ConditionalLogit(dat_dependent_numpy, dat_continuous_numpy, missing='none', groups= dat_group_numpy)
result = cp.fit()
print(result.summary())
