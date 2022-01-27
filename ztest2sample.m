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

function ztest2sample(data_sample1, data_sample2, mean_sample1, mean_sample2, ~, ~)

Nx = length(data_sample1);
Ny = length(data_sample2);

var_sample_1 = var(data_sample1);
var_sample_2 = var(data_sample2);

num = ((mean(data_sample1) - mean(data_sample2)) - (mean_sample1 - mean_sample2));
den = sqrt((var_sample_1/Nx)+(var_sample_2/Ny));
zval_ans = num/den;

fprintf('Z Value: ');
disp(zval_ans);

end

%{
 Link for formula: https://in.mathworks.com/matlabcentral/answers/52633-z-test-with-2-samples;
%}