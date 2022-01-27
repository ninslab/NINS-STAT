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

function rundataproccatregressionlogistic(hObject, eventdata, h)

% Extract Data from the directory
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Data from Individual Handles
%------------------------------------------------------------------------
uploaddependentvarstrlabelval = get(h.uploaddependentvarstrlabel, 'String');
uploadindependentvarstrlabelval = get(h.uploadindependentvarstrlabel, 'String');

% Extract column number values
%-----------------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); %remove non char values from the array
inp_dependent = find(ismember(numcol, uploaddependentvarstrlabelval )); % extract column number
inp_independent = find(ismember(numcol, uploadindependentvarstrlabelval )); % extract column number
label_name_independent = inp_independent;
label_name_dependent = inp_dependent;

% Dependent Variable
%------------------------------------------------------------------------
val_dependent = table2array(data(:,inp_dependent));

% Independent Variables
%------------------------------------------------------------------------
len = length(inp_independent);

for i = 1: len
    val_independent(:,i) = table2array(data(:, inp_independent(i)));
end

fprintf('Test -----> Logistic Regression \n');
fprintf('--------------------------------------------------\n');
fprintf('Results : \n\n');

% Applying Logistic Regression
%------------------------------------------------------------------------
logisticregressionproc(val_independent, val_dependent, label_name_independent,label_name_dependent);

% diary off
% displaycommands(hObject, eventdata, h);
guidata(hObject,h);


end