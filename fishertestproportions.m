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

function fishertestproportions(direc, cat1num, cat2num, alphaval)

% Initializing Variables
%-----------------------
inp_1 = cat1num;
inp_2 = cat2num;

% Reading Excel Sheet
%-----------------------
data = readtable(direc);
data_1 = table2array(data(:, inp_1));
data_2 = table2array(data(:, inp_2));

tab = crosstab(data_1, data_2);

% Displaying Cross Tabulated Data
%---------------------------------
fprintf('Cross Tabulated Table : \n');
disp(tab);

% Applying Fisher Test
%----------------------------------
[h,p,stats] = fishertest(tab ,'Alpha',alphaval);

% Results
%----------------------------------
H_Value = h;
P_Value = estimateto001(p);
Odds_Ratio = stats.OddsRatio;
CI_1 = stats.ConfidenceInterval(1,1);
CI_2 = stats.ConfidenceInterval(1,2);

fprintf('Test -----> Fisher Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

T = table(H_Value,P_Value, Odds_Ratio, CI_1, CI_2);
disp(T);

diary off

end