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

function tukey_post_hoc_repeated(rm,cat_label)

% Perform tukey analysis
post_hoc_table = multcompare(rm, cat_label,'Alpha',0.05,'ComparisonType','tukey-kramer');

fprintf('######################################################################################################## \n');
fprintf('------------------------------ Tukey Kramer Post Hoc Analysis ------------------------------------------ \n');
fprintf('######################################################################################################## \n\n');
disp(post_hoc_table);
fprintf('######################################################################################################## \n');

end