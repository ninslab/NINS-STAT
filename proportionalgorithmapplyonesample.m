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

function proportionalgorithmapplyonesample(alphavalue,successfuloutcomesval,totalsamples,proposedprobval)

% Converting String to Double numericals for analysis
%----------------------------------------------------
s = str2double(successfuloutcomesval);
n = str2double(totalsamples);
p = str2double(proposedprobval);
alpha_val = str2double(alphavalue);

% One Sided Analysis
%--------------------------------------
pone_test = myBinomTest(s,n,p,'one');
p_val = estimateto001(pone_test);

% Two Sided Analysis
%--------------------------------------
pout = myBinomTest(s,n,p,'two');
p_val_1 = estimateto001(pout);

% Calculate probability estimate value
%--------------------------------------
[phat, pci] = binofit(s, n, alpha_val);

% Results
%--------------------------------------
fprintf('One-sided Binomial test (p value):'); disp(p_val);
fprintf('Two-sided Binomial test (p value):');disp(p_val_1);
fprintf('Probability Estimate Value:');disp(phat);
fprintf('Exact Confidence Interval 1:');disp(pci(1));
fprintf('Exact Confidence Interval 2:');disp(pci(2));

end