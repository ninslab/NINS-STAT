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

function mcnemartest(direc, nominal1num, nominal2num)

% Initialize variables
%----------------------
data = readtable(direc);
nominal_data_1 = table2array(data(:, nominal1num));
nominal_data_2 = table2array(data(:, nominal2num));

% Creating cross-tabulated table
%--------------------------------
crosstab_results = crosstab(nominal_data_1, nominal_data_2);

% Calculating Mc-Nemar coefficients
%-----------------------------------
b = crosstab_results(1,2);
c = crosstab_results(2,1);
numerator_coeff = ((b-c)^2);
denominator_coeff = (b+c);

mcnemar_coeff = (numerator_coeff/denominator_coeff);
fprintf('Mc-Nemar test statistic: \n');
disp(mcnemar_coeff);

%{

##########################################################################
NOTE to self
##########################################################################

Mc-nemar test statistics does not calculate Continuity
correction. It just calculates the McNemar test statistics.

Link(formula): http://rasbt.github.io/mlxtend/user_guide/evaluate/mcnemar/

%}

end