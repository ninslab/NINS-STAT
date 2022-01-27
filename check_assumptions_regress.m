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

function [n] = check_assumptions_regress(inp_independent, inp_dependent)

% Initializing variables
%--------------------------------
dat_val = inp_dependent;
dat_independent = inp_independent;

% Algorithm Design
%---------------------------------
fprintf('------------------- \n');
fprintf('Parameter A : Linear Test \n');
fprintf('------------------- \n');

mdl = fitlm(dat_independent, dat_val);
% disp(mdl);
p_1 = coefTest(mdl);
fprintf('P value :');disp(p_1);

if  p_1 < 0.05
    % Non Linear Regression Analysis
    fprintf('Parameter A: Passed (P : Significant) \n');
    n = 1;
    return;
else
    % Linear Regression
    fprintf('Parameter A : Fail (P : Non-Significant) \n');
    n = 3;
    return;
end

end