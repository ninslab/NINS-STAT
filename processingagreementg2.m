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

function processingagreementg2(data, var1, var2)

% Initialize Variables
%----------------------
data_1 = table2array(data(:, var1));
data_2 = table2array(data(:, var2));
alpha_val = 0.05;

% Extract Data
%----------------------
[rows, ~] = size(data_1);
f = [data_1, data_2];

% Algorithm
%-----------------------
fprintf('Test -----> Lin Concordance Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');
a = f_CCC(f, alpha_val);

% Display results
%-----------------------
name = a{1,1}.name;
estimate = a{1,1}.est;
scaleShift = a{1,1}.scaleShift;
locationshift = a{1,1}.locationShift;
biasCorrection = a{1,1}.biasCorrection;
pearsonCorrCoeff = a{1,1}.pearsonCorrCoeff;
CI = a{1,1}.confInterval;

fprintf('Name : ');disp(name);
fprintf('estimate : ');disp(estimate);
fprintf('Scale Shift : ');disp(scaleShift);
fprintf('Location Shift : ');disp(locationshift);
fprintf('Bias Correction : ');disp(biasCorrection);
fprintf('Pearson Correlation Coefficient : ');disp(pearsonCorrCoeff);
fprintf('Confidence Interval : ');disp(CI);

end