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

function survivaloveralldataproc(data, timevar, karnovskyvar)

fprintf('Test -----> Kaplan Meier Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

% Coxphit measures
%----------------------
d_survival = table2array(data(:, timevar));
d_karno = table2array(data(:, karnovskyvar));

[b,logl,H,stats] = coxphfit(d_karno,d_survival)
hr = exp(b);
fprintf('Hazard Ratio: ');
disp(hr);

% Plot Survival graph
figure;
ecdf(d_survival, 'Function', 'survivor');
xlabel('Analysis time');
ylabel('Survival time');
title('Kaplan Meier survival estimation');


% % Plot KM graph - Need to work on it 
% %----------------------
% % Initialize Parameters
% %----------------------
% y = data(:, timevar);
% % censor = data(:, statusvar);
% alpha_val = 0.05;
% 
% % Apply Algorithm
% %----------------------
% data = [y, karnovskyvar];
% kmplot(data, alpha_val);

end