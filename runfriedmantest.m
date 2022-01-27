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

function runfriedmantest(data, inp_num)

[row, col] = size(data);
len = length(inp_num);
reps = len;

for i = 1:len
    x(:,i)= table2array(data(:, inp_num(i)));
end

% Friedman Analysis
[p,tbl,stats] = friedman(x); % Ensure ANOVA table display

% Display results
fprintf('P values: \n\n');disp(p);
fprintf('Table \n\n');disp(tbl);
fprintf('Stats \n\n');disp(stats);

% Post Hoc Analysis - Tukey Analysis
%-------------------
tukey_post_hoc(stats);

end