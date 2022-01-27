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

function cox_proportional(inp_independent, inp_time)

% Initialize Variables
%------------------------------------------------------------------------
time_var_value = inp_time;
data = inp_independent;

% Cox Algorithm
%------------------------------------------------------------------------
[b,logl,H,stats] = coxphfit(data, time_var_value);

% Display Results
%------------------------------------------------------------------------
disp(b);
disp(logl);
disp(H);
disp(stats);

end