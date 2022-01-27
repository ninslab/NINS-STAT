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

function rundataprocrepeat(hObject, eventdata, h)

% Extract Data from browse Directory
%--------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Data from handles
%--------------------------------
uploaddatastring1labelval = get(h.uploaddatastring1label, 'String');
uploaddatastring2labelval = get(h.uploaddatastring2label, 'String');

% titvallabeltextstr = get(h.titvallabeltext, 'String');
% corrinfotextstr = get(h.corrinfotext, 'String');
% bainfolabeltextstr = get(h.bainfolabeltext, 'String');

% Extract column number
%----------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); % remove non char values from the array
inp1 = find(ismember(numcol, uploaddatastring1labelval )); % extract column number
inp2 = find(ismember(numcol, uploaddatastring2labelval)); % extract column number

data1 = table2array(data(:, inp1));
data2 = table2array(data(:, inp2));

% Applying Analysis Algorithm
%--------------------------------
fprintf('Test -----> Bland Altman Analysis \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

% [rpc, fig, statsStruct] = BlandAltman(data1, data2, titvallabeltextstr, 'corrinfo', corrinfotextstr, 'baInfo', bainfolabeltextstr);
[rpc, ~, statsStruct] = BlandAltman(data1, data2);

% Create result table
tbl = table(rpc, statsStruct.r, statsStruct.r2, statsStruct.rho, statsStruct.rhoP, statsStruct.SSE, statsStruct.RMSE, statsStruct.slope, statsStruct.intercept, statsStruct.kurtosis, statsStruct.skewness, statsStruct.differenceMean , statsStruct.differenceSTD, statsStruct.differenceMedian, 'VariableNames',{'Reproducibility_coefficient','R','R2','Spearman_rho_value','Spearman_rho_value_pval','SSE','RMSE','Slope','Intercept','Kurtosis','Skewness','Mean_difference','SD_difference','Median_difference'});

% Display Results
%---------------------------------
disp(tbl);

% diary off
% displaycommands(hObject, eventdata, h);

end