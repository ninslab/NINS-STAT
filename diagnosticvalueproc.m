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

function diagnosticvalueproc(a,b,c,d)

% Sensitivity
%-------------------------------------
fprintf('Test -----> Sensitivity \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_sensitivity = (a/(a+b));
fprintf('Sensitivity :');disp(res_sensitivity);

% Specificity
%--------------------------------------
fprintf('Test -----> Specificity \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_specificity = (d/(d+c));
fprintf('Specificity :');disp(res_specificity);

% Positive Likelihood Ratio
%--------------------------------------
fprintf('Test -----> Positive Likelihood Ratio \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_plr = (res_sensitivity/(1 - res_specificity));
fprintf('Positive Likelihood Ratio :');disp(res_plr);


% Negative Likelihood Ratio
%---------------------------------------
fprintf('Test -----> Negative Likelihood Ratio \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_nlr = ((1 - res_sensitivity)/res_specificity);
fprintf('Negative Likelihood Ratio :');disp(res_nlr);


% Diesease Prevalence
%--------------------------------------
fprintf('Test -----> Diesease Prevalence \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_dp = ((a+b)/(a+b+c+d));
fprintf('Diesease Prevalence :');disp(res_dp);

% Positive Predictive Value
%---------------------------------------
fprintf('Test -----> Positive Predictive Value \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_ppv = (a/(a+c));
fprintf('Positive Predictive Value :');disp(res_ppv);

% Negative Predictive Value
%---------------------------------------
fprintf('Test -----> Negative Predictive Value \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_npv = (d/(b+d));
fprintf('Negative Predictive Value :');disp(res_npv);


fprintf('Test -----> Accuracy \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

res_accuracy = ((a+d)/(a+b+c+d));
fprintf('Accuracy :');disp(res_accuracy);

end