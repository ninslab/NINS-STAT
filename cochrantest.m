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

function cochrantest(data, inp_cat, alpha_value)

len = length(inp_cat);

% Extract column data for Cochran's analysis
for i = 1:len
    data_cat(:,i) = table2array(data(:, inp_cat(i)));
end

% Applying Cochran's test
[h,p,stats] = cochranqtest(data_cat,alpha_value);

% Display Variables
P_Value = estimateto001(p);
H_Value = h;
Q_Value = stats.Q;
DF_Value = stats.df;
Fail_Events = stats.fail;
Pass_Events = stats.pass;
NPass_Value = stats.Npass;
NEff_Value = stats.Neff;

% Display variables in a table
T = table(P_Value, H_Value, Q_Value, DF_Value, Fail_Events, Pass_Events, NPass_Value, NEff_Value);
disp(T);

end