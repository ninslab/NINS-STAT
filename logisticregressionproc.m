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

function logisticregressionproc(val_independent, val_dependent, label_name_independent,label_name_dependent)

% Initializing Variables
%--------------------------------------
data_1 = val_dependent;
data_2 = val_independent;

d_combined = [data_2, data_1];

% Extract Data from the directory
%-----------------------------------------
direc = getappdata(0, 'getbrowsedir');

% Get labels
%--------------------------
[~,~,raw] = xlsread(direc);
labels = [raw(1,label_name_independent), raw(1, label_name_dependent)];

% Create table for model calculation
%------------------------------------
tbl = array2table(d_combined, 'VariableNames', labels);

% Binomial Logistic Regression
%--------------------------------------
mdl = fitglm(tbl, 'Distribution','binomial');

fprintf('Test -----> Logistic Regression \n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('Results : \n\n');
disp(mdl);
fprintf('----------------------------------------------------------------------------\n');

% Add predicted values to excel file
add_predicted_values_logistic(mdl, labels);

end