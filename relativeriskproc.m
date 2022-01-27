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

function relativeriskproc(hObject, eventdata, h)

% Extract data from browse path
%-----------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Get column values
%--------------------------------------
ds1 = get(h.mean2num1label, 'String');
ds2 = get(h.mean2num2label, 'String');

% Extract column values
%--------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_1 = find(ismember(numcol, ds1 )); % extract column number 1
inp_2 = find(ismember(numcol, ds2 )); % extract column number 2

data_1 = table2array(data(:, inp_1));
data_2 = table2array(data(:, inp_2));

% Calculate relative risk
%--------------------------------------
tab_val = crosstab(data_1, data_2);

a = tab_val(1,1);
b = tab_val(1,2);
c = tab_val(2,1);
d = tab_val(2,2);

num_rr = (a/(a+b));
den_rr = (c/(c+d));

% Calculate Relative Risk
%--------------------------------------
relative_risk = (num_rr/den_rr);

% Calculate standard error of the log relative risk
%---------------------------------------------------
se_rr = sqrt((1/a) + (1/c) - (1/(a+b)) - (1/(c+d)));

% Calculate Confidence Interval
%--------------------------------------
CI_1 = exp(log(relative_risk) - (1.96 * se_rr));
CI_2 = exp(log(relative_risk) + (1.96 * se_rr));

% Display Table
%--------------------------------------
Relative_Risk = relative_risk;
Standard_Error = se_rr;
Confidence_Interval_1 = CI_1;
Confidence_Interval_2 = CI_2;

tabl = table(Relative_Risk, Standard_Error, Confidence_Interval_1, Confidence_Interval_2);
disp(tabl);


end

%{
Formula has been taken from:

https://www.medcalc.org/calc/relative_risk.php
%}