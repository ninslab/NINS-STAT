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

function ordinaldataproc(data_1, data_2)

fprintf('Test -----> Contingency Coeffcient\n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

% Algorithm
%---------------------------------------------
% Applying crosstab
%---------------------------------------------
[~, chi2, ~, ~] = crosstab(data_1, data_2);
fprintf('Chi-square statistic : ');disp(chi2);

% Applying formula for Contingency Coefficient
%----------------------------------------------
[row, ~] = size(data_1); % Sample size
num = chi2;
den = row + chi2;
con_coeff = sqrt(num/den);

% Display Results
%---------------------------------------------
Contingency_Coefficient = con_coeff;

% Display Results in Table
%---------------------------------------------
T = table(Contingency_Coefficient);
disp(T);

end