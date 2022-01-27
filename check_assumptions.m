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

function [n] = check_assumptions(data, inp_independent, inp_dependent)

count_positive = 0;
count_negative = 0;
a = length(inp_independent);

fprintf('Proceeding towards Regression Assumption Check..........\n\n');
fprintf('Objective List : \n\n 1) Linear Relationship \n 2) Multivariate Normality \n 3) MultiCollinearity \n 4) Auto-Correlation \n 5) Homoscedasticity \n\n');

fprintf('------------------------- \n');
fprintf('Linear Relationship \n');
fprintf('------------------------- \n\n');
fprintf('Moving forward');


for p =1:a
    dependent_var = data(:, inp_dependent);
    independent_var = data(:, inp_independent(p));
    figure;
    scatter(dependent_var, independent_var);
end

resp = input(sprintf('Is the data Linear ? \n 1) Press 1 for Yes \n 2) Press 2 for No \n'));

if resp == 1
    count_positive = count_positive + 1 ;
else
    count_negative = count_negative + 1;
end


fprintf('------------------------- \n');
fprintf('Multivariate Normality \n');
fprintf('------------------------- \n\n');
fprintf('Moving forward');


s = normal_distribution(data, inp_independent);

if s==1
    fprintf('Data is Normalized... \n');
    count_positive = count_positive + 1;
else
    fprintf('Data is not normalized...\n');
    count_negative = count_negative + 1;
end

fprintf('------------------------- \n');
fprintf('Auto-Correlation \n');
fprintf('------------------------- \n\n');
fprintf('Moving forward');

for h = 1:a
    data(:,h) = data(:,inp_independent(i));
end

[acf,lags,bounds,h] = autocorr(data);
disp(acf);
disp(lags);
disp(bounds);
disp(h);

correlation_input = input(sprintf('Is there any auto-correlation ? 1) Press 1 for Yes (There is presence of autocorrelation) \n 2) Press 2 for No (There is no presence of autocorrelation)\n'));
if correlation_input == 1
    count_negative = count_negative + 1;
else
    count_positive = count_positive + 1;
end

fprintf('------------------------- \n');
fprintf('Homoscedasticity \n');
fprintf('------------------------- \n\n');
fprintf('Moving forward');

for g = 1:a
    d = data(:, inp_independent(g));
    [h,pValue,stat,cValue] = archtest(d);
    disp(h);
    disp(pValue);
    disp(stat);
    disp(cValue);
end

homodes_val = input(sprintf('Is there homoscedascticity ? 1) Press 1 for Yes (Homocedasticity exists) \n 2) Press 2 for No (Homocedasticity doesnt exist) \n'));
if homodes_val == 1
    count_positive = count_positive + 1;
else
    count_negative = count_negative + 1;
end


if count_positive == 5
    fprintf('Data meets the criteria for Linear Regression Analysis.......\n');
    fprintf('Proceeding forward....\n');
    fprintf('Implementing Linear Regression Analysis.............\n');
    
    n = 1;
    return;
    
else
    fprintf('Data doesnt meet the criteria for Linear Regression Analysis.....\n')
    fprintf('Proceeding forward.....\n');
    fprintf('Implementing Non-Linear Regression Analysis............\n');
    
    n = 3;
    return;
    
end


end
