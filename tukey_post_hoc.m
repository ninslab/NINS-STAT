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

function tukey_post_hoc(stats)

% Applying Tukey's kramer to 'stats' file generated from the ANOVA test
[c,m,~,gnames] = multcompare(stats, 'Alpha',0.05, 'CType','tukey-kramer');

% String formatting
[row, ~] = size(c);
str = string.empty;

for i=1:row
    str_prim = strcat(string(c(i,1)),' - ',{' '},string(c(i,2)));
    str(i,1) = str_prim;
end

% Create tablular results
tbl1 = table(gnames, m(:,1),'VariableNames',{'Group','Mean_estimate'});
tbl = table(str,c(:,6), c(:,4),c(:,3),c(:,5),'VariableNames',{'Status_comparison','P_values','Difference_between_means','Lower_CI','Upper_CI'});

% Display text
fprintf('######################################################################################################## \n');
fprintf('------------------------------ Tukey Kramer Post Hoc Analysis ------------------------------------------ \n');
fprintf('######################################################################################################## \n\n');
disp(tbl1);
fprintf('######################################################################################################## \n');
disp(tbl);
fprintf('######################################################################################################## \n');


end