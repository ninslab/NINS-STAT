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

function run2buttonprocedure(hObject, eventdata, h, inp_independent, inp_dependent, label_name_independent,label_name_dependent)


% Implement Non Linear Regression Algorithm
%-------------------------------

modelfunval = get(h.writeequationvalue,'String');
betavalue = get(h.betavalue, 'String');
data_1 = inp_dependent;
data2 = inp_independent;

fprintf('Default format : @(b,x)((b(1)*(x(:,1)^3)) + (b(2)*(x(:,2)^2)) + (b(3)*x(:,3)) + b(4))  \n\n');
fprintf('Default format : beta = [1;1;1;1];  \n\n');

d_combined = [data2, data_1];

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


fprintf('Test -----> Non-Linear Regression\n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

modelfun = str2func(modelfunval);
beta = str2num(betavalue);

md1 = fitnlm(tbl, modelfun, beta);
disp(md1);

% Add predicted values to excel file
add_predicted_values(mdl, labels);

end

% %-----------------DEMO for this Script-----------------------------------
%         data = xlsread('data.xlsx');
%         data_1 = data(:, 2);
%         data_2 = data(:, 3);
%         data_3 = data(:, 4);
%
% %-----------------Without comparison nlmfit function---------------------
%
%         tab = table(data_1, data_2, data_3);
%         modelfun = @(b,x)b(1)+b(2)*x(:,1)+b(3)*x(:,2);
%         beta0 = [1 1 1];
%         md1 = fitnlm(tab, modelfun, beta);
%         disp(md1);
%
% %-----------------Without comparison nlmfit function---------------------
%
%         dat = [data_1, data_2, data_3];
%         modelfun = @(b,x)b(1)+b(2)*x(:,1)+b(3)*x(:,2);
%         beta0 = [1 1 1];
%         md1 = fitnlm(dat,data_1, modelfun, beta);
%         disp(md1);
%
%--------------------------------------------------------------------------
