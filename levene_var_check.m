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

function [r] = levene_var_check(user_input, inp_num, inp_cat)

% Initializing Variables
%------------------------
data_1 = table2array(user_input(:, inp_num));
data_2 = table2array(user_input(:, inp_cat));

% Levene Test
%------------------------
[p, stats] = vartestn(data_1, data_2, 'TestType', 'LeveneAbsolute');

% Diplay Results
%------------------------
P_value = p;
F_Stat_Value = stats.fstat;
DF_1 = stats.df(1);
DF_2 = stats.df(2);

% Display Results in Table
%-------------------------
T = table(P_value,F_Stat_Value,DF_1, DF_2);
disp(T);

% Condition
%-------------------------
if (p > 0.05)
    r = 1;
    return;
else
    r = 2;
    return;
end
end