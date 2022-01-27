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

function welch_anova_test(data, inp_cat, inp_num, direc)

% Initialize Variables
%----------------------
data_cat = table2array(data(:, inp_cat)); % Categorical Data
data_num = table2array(data(:, inp_num)); % Numerical Data
alpha_val = 0.05;
arr = [data_num, data_cat];

% Applying Welch ANOVA Test
%---------------------
welchanova(arr, alpha_val);

% Applying Games Howell post-hoc analysis in R 
filename_gh = 'gamesHowell.R';
cmd = sprintf('Rscript "%s" %s %g %g', filename_gh, direc, inp_num, inp_cat);
system(cmd);

end




