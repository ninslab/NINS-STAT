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

function weightedcohenkappaprocedure(data, data1val, data2val)

% Initializing Variables
%--------------------------------------
data1 = table2array(data(:, data1val));
data2 = table2array(data(:, data2val));
alpha_val = 0.05;

% Algorithm
%--------------------------------------
a = crosstab(data1, data2);
fprintf('Cross Tabulated Data : \n');disp(a);

fprintf('Test -----> Cohen Kappa Test -----> Linear Weighted \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');
kappa(a, 1, alpha_val);

fprintf('Test -----> Cohen Kappa Test -----> Quadratic Weighted \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');
kappa(a, 2 , alpha_val);

end