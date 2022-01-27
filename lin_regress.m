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

function lin_regress(inp_independent, inp_dependent,label_name_independent,label_name_dependent)

% Initialize Variables
%--------------------------
data_1 = inp_dependent;
data = inp_independent;
d_combined = [data, data_1];

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

% Linear Regression
%--------------------------
mdl = fitlm(tbl);

fprintf('Test -----> Linear Regression \n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('Results : \n\n');
disp(mdl);
fprintf('----------------------------------------------------------------------------\n');
disp(anova(mdl,'summary'));
fprintf('----------------------------------------------------------------------------\n');

% Add predicted values to excel file
add_predicted_values(mdl, labels);

end