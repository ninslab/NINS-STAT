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

function student_t_test2(data, inp_num)

% Initialize Variables from handles
%-----------------------------------
data_1 = table2array(data(:, inp_num(1)));
data_2 = table2array(data(:, inp_num(2)));

% Applying Student T Test
%-----------------------------------
[h,p,ci,stats] = ttest(data_1, data_2);

% Display Variables
%-----------------------------------
H_value = h;
P_Value = estimateto001(p);
CI_1 = ci(1,1);
CI_2 = ci(2,1);
Tstat_Value = stats.tstat;
DF = stats.df;
SD = stats.sd;

% Display Variables in Tables
%-----------------------------------
T = table(H_value,P_Value,CI_1,CI_2,Tstat_Value,DF,SD);
disp(T);

end
