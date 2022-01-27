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

function rundataprocagreementg2cat(hObject, eventdata, h)

% Initialize Variables
%-------------------------------------
alpha_val = 0.05;
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% get Handle Data
%------------------------------------
var1valuelabelval = get(h.var1valuelabel, 'String');
cells = cellstr(var1valuelabelval);
len = length(cells);

% Extract column number
%----------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); % remove non char values from the array
% inp1 = find(strcmp(numcol, var1valuelabelval)); % extract column number

% Extract Excel Data
%------------------------------------
for i = 1: len
    inp1 = find(ismember(numcol, cells{i}));
    d(:,i) = table2array(data(:, inp1));
end

fprintf('Test -----> Intraclass Correlations Coefficient \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

[r, LB, UB, F, df1, df2, p] = ICC(d, '1-1', alpha_val, 1);

% Display Results
%--------------------------------------
fprintf('R value : ');disp(r);
fprintf('Lower Bound Value :');disp(LB);
fprintf('Upper Bound Value :');disp(UB);
fprintf('F value :');disp(F);
fprintf('DF1 :');disp(df1);
fprintf('DF2 :');disp(df2);
fprintf('P value :');disp(p);

end