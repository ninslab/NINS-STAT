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

function survivalprocsubset(data, timevar, groupvar)

fprintf('Test -----> Kaplan Meier Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

TimeVar = table2array(data(:, timevar));
% EventVar = data(:, statusvar);
GroupVar = table2array(data(:, groupvar));

% KM Algorithm
%----------------------------------------------------
[b,logL,H,stats] = coxphfit(GroupVar,TimeVar)
fprintf('Hazard Ratio: \n');
disp(exp(b));

% Plot Graphs

a = unique(GroupVar);
len = length(a);
strlabels = [];

for i = 1:len
    index_trt = find(GroupVar == a(i));
    surv_time = TimeVar(index_trt,1);
    
    figure(2);
    ecdf(surv_time,'Function','survivor');
    xlabel('Analysis time');
    ylabel('Survival time');
    title('Kaplan Meier survival estimation');
    
    hold on;
    
    str = strcat('Treatment -- ', num2str(a(i)));
    strlabels{i} = str;
    
end

legend(convertStringsToChars(strlabels));

end