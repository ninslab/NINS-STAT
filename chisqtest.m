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

function chisqtest(data, inp_cat)

len = length(inp_cat);

for i = 1:len
    dat(:,i) = table2array(data(:, inp_cat(i)));
end

% Applying Chi-square test
%-----------------------------------------------------------
[~, chi2, p, ~] = crosstab_modified(dat);

% Visualization
%-----------------------------------------------------------
Chi_SQ = chi2;
P_Value = estimateto001(p);

T = table(Chi_SQ, P_Value);
disp(T);


end