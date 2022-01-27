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

function anova_test(data, inp_cat, inp_num)

%Initialize variables
%--------------------
data_cat = table2array(data(:, inp_cat)); % Categorical Data
data_num = table2array(data(:, inp_num)); % Numerical Data

% Applying ANOVA test
%--------------------
[p,anovatab, stats] = anova1(data_num, data_cat);

% Displaying Results
%-------------------
p_val = estimateto001(p);
% disp(p_val);
disp(anovatab);
disp(stats);

% Post Hoc Analysis - Tukey Analysis
%-------------------
tukey_post_hoc(stats);

end
