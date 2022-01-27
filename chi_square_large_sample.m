% NINS-STAT Graphical User Interface
% start.m function starts the entire
% interface.
%
% Final revision date : 11th August 2021

% Author:
% Dr. Pravat K. Mandal
% Neuroimaging and Neurospectroscopy Lab,
% National Brain Research Centre,
% Manesar, India

function chi_square_large_sample(direc, cat1num, cat2num, alphaval)

% extract data
data = readtable(direc);

% extract column data
data_col_1 = table2array(data(:, cat1num));
data_col_2 = table2array(data(:, cat2num));

% Chi-square test and coefficient 
%{Actual command - [tbl,chi2,p,labels] = crosstab(data_col_1, data_col_2);}

[~,chi2,p,~] = crosstab(data_col_1, data_col_2);

% Results
%----------------------------------
Chi_Sq_Coeff = chi2;
P_Value = estimateto001(p);

fprintf('Test -----> Chi-Square Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

T = table(Chi_Sq_Coeff,P_Value);
disp(T);

diary off

end