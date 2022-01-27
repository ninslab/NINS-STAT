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

function krusk(data, inp_cat, inp_num)

% Initialize Variables
%---------------------------
data_cat = table2array(data(:, inp_cat));
data_num = table2array(data(:, inp_num));

% Applying Krusk Wallis Test
%---------------------------
[p, tbl, stats] = kruskalwallis(data_num,data_cat);

% Display Results
%---------------------------
p_val = estimateto001(p);
disp(p_val);
disp(tbl);
disp(stats);

% Post Hoc Analysis - Tukey Analysis
%-------------------
tukey_post_hoc(stats);

end