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

function rundataprocagreementg2categorical(hObject, eventdata, h)

% Extract Data from browse directory
%------------------------------------------------------------------------
direc = getappdata(0, 'getbrowsedir');
data = readtable(direc);

% Extract Data from Handles
%------------------------------------------------------------------------
var1valuelabelval = get(h.var1valuelabel, 'String');
var2valuelabelval = get(h.var2valuelabel, 'String');

% Extract column number
%----------------------------------------------------
[~,~,raw] = xlsread(direc);
numcol = raw(1,:);
numcol = numcol(cellfun('isclass', numcol,'char')); % remove non char values from the array
inp1 = find(ismember(numcol, var1valuelabelval)); % extract column number
inp2 = find(ismember(numcol, var2valuelabelval)); % extract column number

% Decision Algorithm
%------------------------------------------------------------------------
weightedcohenkappaprocedure(data, inp1, inp2);

end