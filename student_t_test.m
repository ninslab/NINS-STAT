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

function student_t_test(data,inp,hypo_val)

% Initialize Variables
%---------------------
data1 = table2array(data(:, inp));

% T Test Initialize
%---------------------
[h,p,ci,stats] = ttest(data1, hypo_val);

% Values
%---------------------
H_Value = h;
P_Value = estimateto001(p);
CI_1 = ci(1,1);
CI_2 = ci(2,1);
T_Stat_Value = stats.tstat;
DOF = stats.df;
SD = stats.sd;

% Display Tables
%-----------------------
T = table(H_Value, P_Value,CI_1,CI_2,T_Stat_Value,DOF,SD);
disp(T);

end

