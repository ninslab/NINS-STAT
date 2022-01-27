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

function processingagreement2(data, var1, var2)

% Initialize variables
%------------------------
data_1 = table2array(data(:, var1));
data_2 = table2array(data(:, var2));
alpha_val = 0.05;

% Algorithm and Results
%------------------------
fprintf('Test -----> Cohen Kappa Analysis \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

cross_value = crosstab(data_1, data_2);
fprintf('Cross Tabulated Data :  \n');disp(cross_value);
kappa(cross_value, 0, alpha_val);

end