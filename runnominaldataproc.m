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

function runnominaldataproc(hObject, eventdata, h)

% Initialize variables
%--------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extact Handle Values
%--------------------------------------
nominalinp1vallabelval = get(h.nominalinp1vallabel, 'String');
nominalinp2vallabelval = get(h.nominalinp2vallabel, 'String');

[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
val1 = find(ismember(numcol, nominalinp1vallabelval)); % extract column number , continuous data
val2 = find(ismember(numcol, nominalinp2vallabelval)); % extract column number, binary column

data_1 = table2array(data(:, val1)); % Continuous Data
data_2 = table2array(data(:, val2)); % Binary Data
alpha_value = 0.05;

%------------------Point Biserial Algorithm-------------------------------
%-------------------------------------------------------------------------
fprintf('Test -----> Point Biserial Test \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

% Algorithm
%-------------------------------------------------------------------------
[r,h,p,ci] = pointbiserial(data_2,data_1,alpha_value);

% Display Results
%-------------------------------------------------------------------------
R_Value = r;
H_Value = h;
P_Value = estimateto001(p);
CI_1 = ci(1);
CI_2 = ci(2);

% Display Results in Table
%-------------------------------------------------------------------------
T = table(R_Value, H_Value, P_Value, CI_1, CI_2);
disp(T);

% diary off
% displaycommands(hObject, eventdata, h);

end