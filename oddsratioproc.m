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

function oddsratioproc(hObject, eventdata, h)

% Extract data from browse path
%-----------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Get Column values
%------------------
data_1 = get(h.mean2num1label, 'String');
data_2 = get(h.mean2num2label, 'String');

% Extrct values
%------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_1 = find(ismember(numcol, data_1 )); % extract column number 1
inp_2 = find(ismember(numcol, data_2 )); % extract column number 2

dat1 = table2array(data(:, inp_1));
dat2 = table2array(data(:, inp_2));

% Calculate Odds Ratio
%---------------------
tbl_val = crosstab(dat1, dat2);

a = tbl_val(1,1);
b = tbl_val(1,2);
c = tbl_val(2,1);
d = tbl_val(2,2);

num_or = a*d;
den_or = b*c;

% Odds Ratio
%-----------------------------------------------------------
or_val = (num_or/ den_or);

% Calculate Standard error of the log odds ratio
%-----------------------------------------------------------
se_error = sqrt((1/a)+(1/b)+(1/c)+(1/d));

% Calculate 95 % confidence interval
%-----------------------------------------------------------
CI_1 = exp(log(or_val) - (1.96 * se_error));
CI_2 = exp(log(or_val) + (1.96 * se_error));

% Table Display
%-----------------------------------------------------------
Odds_Ratio = or_val;
Standard_Error = se_error;
Confidence_Interval_1 = CI_1;
Confidence_Interval_2 = CI_2;

tab = table(Odds_Ratio, Standard_Error, Confidence_Interval_1, Confidence_Interval_2);
disp(tab);


end

